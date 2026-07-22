# Homebrew tap for Taskr

This tap provides the [Taskr](https://github.com/Iliorn/taskr) terminal task
manager as a Homebrew formula.

## Install

```sh
brew install iliorn/tap/taskr
```

Then launch Taskr from a terminal:

```sh
taskr
```

The formula builds Taskr from its tagged source and installs it as a terminal
program. It does not install a macOS `.app` bundle, so the Finder/Gatekeeper
flow for downloaded applications does not apply.

## Update

```sh
brew update
brew upgrade taskr
```

Taskr releases update this formula automatically. If an update is not visible
yet, run `brew update` before `brew upgrade taskr`.

## Uninstall

```sh
brew uninstall taskr
```

Task data in `~/.taskr` is deliberately retained when the formula is removed.
