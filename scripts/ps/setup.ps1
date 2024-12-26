#!/usr/bin/env pwsh
# Requires PowerShell 7+

# source this script to prepare some common environment variables

# adapted from https://github.com/johannes-wolf/cetz/blob/35c0868378cea5ad323cc0d9c2f76de8ed9ba5bd/scripts/package
# licensed under Apache License 2.0

# Local package directories per platform
if ($env:OS -eq "Linux") {
    $DATA_DIR = if ($env:XDG_DATA_HOME) { $env:XDG_DATA_HOME } else { "$HOME/.local/share" }
} elseif ($env:OS -eq "Darwin") {
    $DATA_DIR = "$HOME/Library/Application Support"
} else {
    $DATA_DIR = $env:APPDATA
}

function Read-Toml {
    param (
        [string]$File,
        [string]$Key
    )
    # Read a key-value pair in the format: <key> = "<value>"
    # stripping surrounding quotes.
    $regex = "^$Key\s*=\s*`"(.*)`""
    Get-Content -Path $File | ForEach-Object {
        if ($_ -match $regex) {
            return $matches[1]
        }
    }
}

$ROOT = Join-Path -Path (Split-Path -Path $PSScriptRoot -Parent) -ChildPath ".."  # macOS has no realpath
$PKG_PREFIX = Read-Toml -File (Join-Path -Path $ROOT -ChildPath "typst.toml") -Key "name"
$VERSION = Read-Toml -File (Join-Path -Path $ROOT -ChildPath "typst.toml") -Key "version"

function Resolve-Target {
    param (
        [string]$Target
    )

    if ($Target -eq "@local") {
        Write-Output "$DATA_DIR/typst/packages/local"
    } elseif ($Target -eq "@preview") {
        Write-Output "$DATA_DIR/typst/packages/preview"
    } else {
        Write-Output $Target
    }
}
