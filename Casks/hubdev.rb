cask "hubdev" do
  version "1.9.67"

  on_arm do
    url "https://pub-51b22bf3fd5a4d73a4ed580105cfc09f.r2.dev/v#{version}/HubDev-macos-arm64.dmg"
    sha256 "c9501add88ac15b2c247bc6d440ec91f51c1fc08148f31ab723121712e6a5705"
  end

  on_intel do
    url "https://pub-51b22bf3fd5a4d73a4ed580105cfc09f.r2.dev/v#{version}/HubDev-macos-amd64.dmg"
    sha256 "e27f7e3a5c731687c6f6f0f37eebccb8ecdb6c89b37ffbebd12409f06a405cef"
  end

  name "HubDev"
  desc "Hybrid Development Environment Manager — manage local dev services with a native GUI"
  homepage "https://hubdev.io"

  livecheck do
    url "https://github.com/hubdev-io/devhub/releases/latest"
    strategy :header_match
  end

  auto_updates true
  depends_on macos: ">= :catalina"

  app "hubdev.app"

  uninstall quit: "com.wails.devhub"

  zap trash: [
    "~/.local/share/hubdev",
    "~/Library/Application Support/hubdev",
    "~/Library/Preferences/io.hubdev.plist",
    "~/Library/Caches/hubdev",
  ]
end
