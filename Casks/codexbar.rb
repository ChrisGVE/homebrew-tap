cask "codexbar" do
  version "0.29.2"
  sha256 "PLACEHOLDER"

  url "https://github.com/ChrisGVE/CodexBar/releases/download/v#{version}/CodexBar-x86_64-v#{version}.zip"
  name "CodexBar"
  desc "AI-powered menu bar app for developer tools monitoring"
  homepage "https://github.com/steipete/CodexBar"

  depends_on macos: ">= :sonoma"

  app "CodexBar.app"

  zap trash: [
    "~/Library/Application Support/CodexBar",
    "~/Library/Preferences/com.steipete.codexbar.plist",
    "~/Library/Caches/com.steipete.codexbar",
    "~/Library/HTTPStorages/com.steipete.codexbar",
  ]
end
