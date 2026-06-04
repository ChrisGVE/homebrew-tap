# ChrisGVE Homebrew Tap

Custom Homebrew formulae and casks by [ChrisGVE](https://github.com/ChrisGVE).

## Usage

```bash
brew tap ChrisGVE/tap
```

### Trusting the tap

Recent Homebrew (tap-trust enforcement, May 2026) warns about — and will
soon require — explicit trust for non-official taps. Trust this tap once:

```bash
brew trust ChrisGVE/tap
```

Verify the exact syntax on your version with `brew trust --help`. Trust is
per-machine, stored in `$(brew --prefix)/var/homebrew/trust.json` — each user
runs it once; a tap cannot be trusted globally by the publisher.

If `brew` blocks an install before you have trusted the tap, you can
temporarily set `HOMEBREW_NO_REQUIRE_TAP_TRUST=1` (not recommended; this
variable will be removed in a later Homebrew release).

## Install

```bash
# Cask (macOS menu-bar app — Intel + Apple Silicon)
brew install --cask codexbar

# Formulae
brew install ChrisGVE/tap/codesize
brew install ChrisGVE/tap/workspace-qdrant-mcp
```

## Available

| Name | Type | Description |
|------|------|-------------|
| [codexbar](https://github.com/steipete/CodexBar) | cask | AI-powered menu bar app for developer tools monitoring |
| [codesize](https://github.com/ChrisGVE/codesize) | formula | Report code size violations by file and function |
| [workspace-qdrant-mcp](https://github.com/ChrisGVE/workspace-qdrant-mcp) | formula | Project-scoped vector database for AI assistants with hybrid search |

## Troubleshooting

```bash
brew update
brew doctor
```

`brew doctor` may report this tap as "not trusted" until you run
`brew trust ChrisGVE/tap` (see [Trusting the tap](#trusting-the-tap)).
