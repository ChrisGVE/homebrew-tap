class Moonswift < Formula
  desc "Terminal UI editor and runner for Lua fragments in structured files"
  homepage "https://github.com/ChrisGVE/moonswift"
  version "0.1.0"
  license "Apache-2.0"

  # macOS-only: MoonSwift renders through a vendored Rust ratatui FFI shim and
  # targets macOS 13+. The release artifact is a single universal (arm64 +
  # x86_64) binary, so there is no per-arch URL split.
  depends_on macos: :ventura

  url "https://github.com/ChrisGVE/moonswift/releases/download/v#{version}/moonswift_universal.zip"
  sha256 "938f07cc1ca713f2526fcfdbe4698a523275c292829a6f8cf00677afbbcf3d69"

  def install
    # The release zip contains the lipo'd universal binary named
    # `moonswift_universal`; install it under the canonical command name.
    bin.install "moonswift_universal" => "moonswift"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/moonswift --version")
  end
end
