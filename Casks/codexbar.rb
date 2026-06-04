cask "codexbar" do
  version "0.32.5"
  sha256 "9fc240a1bca1e4f59ab3136e22fe3dbc71c7aa4b77a4f5f3d3a7651c64990c74"

  url "https://github.com/ChrisGVE/CodexBar/releases/download/v#{version}/CodexBar-x86_64-v#{version}.zip"
  name "CodexBar"
  desc "AI-powered menu bar app for developer tools monitoring"
  homepage "https://github.com/steipete/CodexBar"

  depends_on macos: ">= :sonoma"

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
