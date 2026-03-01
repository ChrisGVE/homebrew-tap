# Homebrew Tap for workspace-qdrant-mcp

Homebrew formulae for [workspace-qdrant-mcp](https://github.com/ChrisGVE/workspace-qdrant-mcp) — a project-scoped vector database for AI assistants with hybrid search.

## Install

```bash
brew install ChrisGVE/tap/workspace-qdrant
```

## Start the daemon

```bash
brew services start workspace-qdrant
```

## Prerequisites

workspace-qdrant-mcp requires a running [Qdrant](https://qdrant.tech/) instance:

```bash
docker run -d --name qdrant -p 6333:6333 -v qdrant_storage:/qdrant/storage qdrant/qdrant
```

## Verify

```bash
wqm admin health
```

## Service management

```bash
brew services start workspace-qdrant    # Start daemon
brew services stop workspace-qdrant     # Stop daemon
brew services restart workspace-qdrant  # Restart daemon
brew services info workspace-qdrant     # Show service status
```

## Upgrade

```bash
brew upgrade workspace-qdrant
brew services restart workspace-qdrant
```

## Documentation

- [Quick Start](https://github.com/ChrisGVE/workspace-qdrant-mcp/blob/main/docs/quick-start.md)
- [User Manual](https://github.com/ChrisGVE/workspace-qdrant-mcp/blob/main/docs/user-manual.md)
- [CLI Reference](https://github.com/ChrisGVE/workspace-qdrant-mcp/blob/main/docs/reference/cli.md)
- [MCP Tools Reference](https://github.com/ChrisGVE/workspace-qdrant-mcp/blob/main/docs/reference/mcp-tools.md)
