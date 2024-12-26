#!/usr/bin/env pwsh
# Requires PowerShell 7+

# adapted from https://github.com/johannes-wolf/cetz/blob/35c0868378cea5ad323cc0d9c2f76de8ed9ba5bd/scripts/package
# licensed under Apache License 2.0

. $PSScriptRoot\setup.ps1

if ($args.Count -lt 1 -or $args[0] -eq "help") {
    Write-Output "package TARGET"
    Write-Output ""
    Write-Output "Packages all relevant files into a directory named '<name>/<version>'"
    Write-Output "at TARGET. If TARGET is set to @local or @preview, the local Typst package"
    Write-Output "directory will be used so that the package gets installed for local use."
    Write-Output "The name and version are read from 'typst.toml' in the project root."
    Write-Output ""
    Write-Output "Local package prefix: $DATA_DIR/typst/package/local"
    Write-Output "Local preview package prefix: $DATA_DIR/typst/package/preview"
    exit 1
}

$TARGET = Resolve-Target $args[0]
Write-Output "Install dir: $TARGET"

# ignore rules
$ignores = Get-Content ".typstignore" | Where-Object { $_ -notmatch '^#' -and $_ -match '\S' }

# recursively print all files that are not excluded via .typstignore
function Enumerate-Files {
    param (
        [string]$root
    )

    if (Test-Path $root -PathType Leaf) {
        Write-Output $root
    } else {
        $files = Get-ChildItem -Path $root -Depth 1 -Force -Exclude ".git", ".typstignore"

        foreach ($file in $files) {
            $include = $true

            foreach ($ignore in $ignores) {
                if ($ignore -like "!*") {
                    $pattern = $ignore.Substring(1)
                    if ($file.FullName -like $pattern) {
                        $include = $true
                        break
                    }
                } elseif ($file.FullName -like $ignore) {
                    $include = $false
                    break
                }
            }

            if ($include) {
                Enumerate-Files -root $file.FullName | Resolve-Path -Relative
            }
        }
    }
}

function New-TemporaryDirectory {
    $tmp = [System.IO.Path]::GetTempPath()
    $name = (New-Guid).ToString("N")
    New-Item -ItemType Directory -Path (Join-Path $tmp $name)
}

# List of all files that get packaged
$files = Enumerate-Files -Root "."

# Temporary directory for packaging
$TMP = [System.IO.Path]::GetTempPath() + [System.Guid]::NewGuid().ToString()
New-Item -ItemType Directory -Path $TMP | Out-Null

foreach ($file in $files) {
    $destination = Join-Path -Path $TMP -ChildPath $file.Substring(2)  # Remove './' from paths
    New-Item -ItemType Directory -Path (Split-Path -Path $destination) -Force | Out-Null
    Copy-Item -Path $file -Destination $destination -Recurse -Force
}

$TARGET = Join-Path -Path $TARGET -ChildPath "$PKG_PREFIX/$VERSION"
Write-Host "Packaged to: $TARGET"

if (Test-Path -Path $TARGET) {
    Remove-Item -Path $TARGET -Recurse -Force
    Write-Host "Overwriting existing version."
}

New-Item -ItemType Directory -Path $TARGET -Force | Out-Null

# Include hidden files by enabling a wildcard for dot-prefixed files
Get-ChildItem -Path $TMP -Recurse -Force | Move-Item -Destination $TARGET -Force
