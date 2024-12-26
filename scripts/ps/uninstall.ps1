#!/usr/bin/env pwsh
# Requires PowerShell 7+

# adapted from https://github.com/johannes-wolf/cetz/blob/35c0868378cea5ad323cc0d9c2f76de8ed9ba5bd/scripts/package
# licensed under Apache License 2.0

. $PSScriptRoot\setup.ps1

if ($args.Count -lt 1 -or $args[0] -eq "help") {
    Write-Output "uninstall TARGET"
    Write-Output ""
    Write-Output "Removes the package installed into a directory named '<name>/<version>'"
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

$TARGET = Join-Path -Path $TARGET -ChildPath "$PKG_PREFIX/$VERSION"
Write-Output "Package to uninstall: $TARGET"

if (-Not (Test-Path -Path $TARGET)) {
    Write-Output "Package was not found."
}

Remove-Item -Path $TARGET -Recurse -Force  # surely this cant fail
Write-Output "Successfully removed."