cask "codexbar" do
  version "0.31.1"
  sha256 "37e0a7696cc63f5c8efd0baaafc50db2fbb7bdba5d85538970256d1ba13d024e"

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
