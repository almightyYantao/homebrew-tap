cask "baton" do
  version "0.5.5"
  sha256 "063d5a26602423f4ae856d8d5d78d6b1c667c2ab491f0476fb1879a095b51990"

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

  # No launchctl here: uninstall also runs on upgrade and would drop the
  # user's login item. zap removes it.
  uninstall quit: "com.longbridge.claude-switch"

  zap launchctl: "com.longbridge.baton",
      trash:     [
        "~/.baton",
        "~/Library/LaunchAgents/com.longbridge.baton.plist",
        "~/Library/Preferences/com.longbridge.claude-switch.plist",
      ]
end
