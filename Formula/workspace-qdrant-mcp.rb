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
  version "0.1.3"
  license "MIT"

  # Platform-specific pre-built binary downloads
  on_macos do
    on_arm do
      url "https://github.com/ChrisGVE/workspace-qdrant-mcp/releases/download/v#{version}/workspace-qdrant-mcp-darwin-arm64.tar.gz"
      sha256 "d871327af79acc1a681dddd0699b71bfabe3ed66f6fd1bb9abad59dc7d4fd24f"
    end
    on_intel do
      url "https://github.com/ChrisGVE/workspace-qdrant-mcp/releases/download/v#{version}/workspace-qdrant-mcp-darwin-x64.tar.gz"
      sha256 "c5a549818fa253e2fddb57721762404183eafd23f47f5c52bdf93c8d1c9eb1ff"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ChrisGVE/workspace-qdrant-mcp/releases/download/v#{version}/workspace-qdrant-mcp-linux-arm64.tar.gz"
      sha256 "0d22aeccb23a85818fbfb02541dfe4a3452b94573bfced24fe53b8be0dc4bc40"
    end
    on_intel do
      url "https://github.com/ChrisGVE/workspace-qdrant-mcp/releases/download/v#{version}/workspace-qdrant-mcp-linux-x64.tar.gz"
      sha256 "2e7b0c4971f6777068ae880880fccbe1830a5205e13f52aa4c442152fe3b060e"
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
