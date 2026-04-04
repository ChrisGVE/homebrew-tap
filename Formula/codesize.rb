class Codesize < Formula
  desc "Report code size violations by file and function"
  homepage "https://github.com/ChrisGVE/codesize"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ChrisGVE/codesize/releases/download/v#{version}/codesize-darwin-arm64.tar.gz"
      sha256 "PLACEHOLDER"
    end
    on_intel do
      url "https://github.com/ChrisGVE/codesize/releases/download/v#{version}/codesize-darwin-x64.tar.gz"
      sha256 "PLACEHOLDER"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ChrisGVE/codesize/releases/download/v#{version}/codesize-linux-arm64.tar.gz"
      sha256 "PLACEHOLDER"
    end
    on_intel do
      url "https://github.com/ChrisGVE/codesize/releases/download/v#{version}/codesize-linux-x64.tar.gz"
      sha256 "PLACEHOLDER"
    end
  end

  def install
    bin.install "codesize"
    generate_completions_from_executable(bin/"codesize", "init")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/codesize --version")
  end
end
