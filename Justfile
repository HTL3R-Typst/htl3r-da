root := justfile_directory()
set shell := ["bash", "-uc"]
set windows-shell := ["powershell.exe", "-NoLogo", "-Command"]

export TYPST_ROOT := root

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
l-package target:
  ./scripts/package "{{target}}"

# install the library with the "@local" prefix on linux
install: (l-package "@local")

# install the library with the "@preview" prefix (for pre-release testing) on linux
install-preview: (l-package "@preview")

# package the library into the specified destination folder on windows
w-package target:
  ./scripts/ps/package.ps1 "{{target}}"

# install the library with the "@local" prefix on windows
w-install: (w-package "@local")

# install the library with the "@preview" prefix (for pre-release testing) on windows
w-install-preview: (w-package "@preview")

[private]
l-remove target:
  ./scripts/uninstall "{{target}}"

# uninstalls the library from the "@local" prefix
uninstall: (l-remove "@local")

# uninstalls the library from the "@preview" prefix (for pre-release testing)
uninstall-preview: (l-remove "@preview")

w-remove target:
  ./scripts/ps/uninstall.ps1 "{{target}}"

# uninstalls the library from the "@local" prefix
w-uninstall: (w-remove "@local")

# uninstalls the library from the "@preview" prefix (for pre-release testing)
w-uninstall-preview: (w-remove "@preview")

# run ci suite
ci: test doc

# format all typst documents in the project
format:
	typstyle format-all "{{root}}"

# optimize all pngs with oxipng
oxipng:
	find . -name "*.png" -exec oxipng {} \;
