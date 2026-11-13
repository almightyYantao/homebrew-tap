cask "baton" do
  version "0.5.3"
  sha256 "16b2da7572b73761b4be712f94a39a32e15d1d95090bfbc073978374f5f38275"

  url "https://github.com/almightyYantao/Baton-Public/releases/download/v#{version}/Baton-#{version}.dmg"
  name "Baton"
  desc "Menu bar AI gateway that falls back to OneAPI when subscription quota runs out"
  homepage "https://github.com/almightyYantao/Baton-Public"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :monterey

  app "Baton.app"

  uninstall launchctl: "com.longbridge.baton",
            quit:      "com.longbridge.claude-switch"

  zap trash: [
    "~/.baton",
    "~/Library/LaunchAgents/com.longbridge.baton.plist",
    "~/Library/Preferences/com.longbridge.claude-switch.plist",
  ]
end
