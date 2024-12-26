_root := justfile_directory()
set shell := ["bash", "-uc"]
set windows-shell := ["powershell.exe", "-NoLogo", "-Command"]

export TYPST_ROOT := _root

[private]
default:
	@just --list --unsorted

# generate manual
doc:
	typst compile docs/manual.typ docs/manual.pdf

# run test suite
test *args:
	typst-test run {{ args }}

# update test cases
update *args:
	typst-test update {{ args }}

# package the library into the specified destination folder on linux
[linux]
package target:
  ./scripts/package "{{target}}"

# package the library into the specified destination folder on windows
[windows]
package target:
  ./scripts/ps/package.ps1 "{{target}}"

# install the library with the "@local" prefix on linux
[linux]
install: (package "@local")

# install the library with the "@local" prefix on windows
[windows]
install: (package "@local")

# install the library with the "@preview" prefix (for pre-release testing) on linux
[linux]
install-preview: (package "@preview")

# install the library with the "@preview" prefix (for pre-release testing) on windows
[windows]
install-preview: (package "@preview")

[private]
[linux]
remove target:
  ./scripts/uninstall "{{target}}"

[private]
[windows]
remove target:
  ./scripts/ps/uninstall.ps1 "{{target}}"

# uninstalls the library from the "@local" prefix
[linux]
uninstall: (remove "@local")

# uninstalls the library from the "@local" prefix
[windows]
uninstall: (remove "@local")

# uninstalls the library from the "@preview" prefix (for pre-release testing)
[linux]
uninstall-preview: (remove "@preview")

# uninstalls the library from the "@preview" prefix (for pre-release testing)
[windows]
uninstall-preview: (remove "@preview")

# run ci suite
ci: test doc

# format all typst documents in the project
format:
	typstyle format-all "{{_root}}"

# optimize all pngs with oxipng
oxipng:
	find . -name "*.png" -exec oxipng {} \;
