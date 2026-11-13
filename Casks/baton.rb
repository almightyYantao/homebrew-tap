cask "baton" do
  version "0.5.2"
  sha256 "4b80576c2309b1c135595d62f61aae1f4993db36a347ede39dc2505be2ffdaaf"

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
