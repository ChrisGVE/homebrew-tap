cask "codexbar" do
  version "0.32.6"
  sha256 "2ca30874d43869c1ebe81b9af509a55aabcb71b8b4749d282b6d94f1b9b5dbdd"

  url "https://github.com/ChrisGVE/CodexBar/releases/download/v#{version}/CodexBar-x86_64-v#{version}.zip"
  name "CodexBar"
  desc "AI-powered menu bar app for developer tools monitoring"
  homepage "https://github.com/steipete/CodexBar"

  depends_on macos: :sonoma

  app "CodexBar.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/CodexBar.app"]
  end

  zap trash: [
    "~/Library/Application Support/CodexBar",
    "~/Library/Preferences/com.steipete.codexbar.plist",
    "~/Library/Caches/com.steipete.codexbar",
    "~/Library/HTTPStorages/com.steipete.codexbar",
  ]
end
