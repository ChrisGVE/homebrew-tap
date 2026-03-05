# Homebrew formula for workspace-qdrant-mcp
#
# Install:
#   brew install ChrisGVE/tap/workspace-qdrant-mcp
#
# Start the daemon service:
#   brew services start workspace-qdrant-mcp

class WorkspaceQdrantMcp < Formula
  desc "Project-scoped vector database for AI assistants with hybrid search"
  homepage "https://github.com/ChrisGVE/workspace-qdrant-mcp"
  version "0.4.0"
  license "MIT"

  # Platform-specific pre-built binary downloads
  on_macos do
    on_arm do
      url "https://github.com/ChrisGVE/workspace-qdrant-mcp/releases/download/v#{version}/workspace-qdrant-mcp-darwin-arm64.tar.gz"
      # sha256 "PLACEHOLDER"
    end
    on_intel do
      url "https://github.com/ChrisGVE/workspace-qdrant-mcp/releases/download/v#{version}/workspace-qdrant-mcp-darwin-x64.tar.gz"
      # sha256 "PLACEHOLDER"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ChrisGVE/workspace-qdrant-mcp/releases/download/v#{version}/workspace-qdrant-mcp-linux-arm64.tar.gz"
      # sha256 "PLACEHOLDER"
    end
    on_intel do
      url "https://github.com/ChrisGVE/workspace-qdrant-mcp/releases/download/v#{version}/workspace-qdrant-mcp-linux-x64.tar.gz"
      # sha256 "PLACEHOLDER"
    end
  end

  def install
    bin.install "wqm"
    bin.install "memexd"

    if File.exist?("completions/wqm.bash")
      bash_completion.install "completions/wqm.bash" => "wqm"
    end
    if File.exist?("completions/wqm.zsh")
      zsh_completion.install "completions/wqm.zsh" => "_wqm"
    end
    if File.exist?("completions/wqm.fish")
      fish_completion.install "completions/wqm.fish"
    end
  end

  def post_install
    (var/"workspace-qdrant-mcp").mkpath
  end

  def caveats
    <<~EOS
      To start using workspace-qdrant-mcp:

      1. Start Qdrant (if not already running):
         docker run -d -p 6333:6333 -v qdrant_storage:/qdrant/storage qdrant/qdrant

      2. Start the daemon:
         brew services start workspace-qdrant-mcp

      3. Check connectivity:
         wqm admin health

      For MCP server integration with Claude, see:
        https://github.com/ChrisGVE/workspace-qdrant-mcp#readme
    EOS
  end

  service do
    run [opt_bin/"memexd"]
    keep_alive true
    working_dir var/"workspace-qdrant-mcp"
    log_path var/"log/memexd.log"
    error_log_path var/"log/memexd.error.log"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wqm --version")
    assert_match "memexd", shell_output("#{bin}/memexd --help")
  end
end
