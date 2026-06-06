cask "codexbar" do
  version "0.32.5"
  sha256 "451db8c75e21177afee087136b0f4dcfc440d301bda34b0413d2328034a49069"

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
