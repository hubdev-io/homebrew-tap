cask "hubdev" do
  version "1.9.55"

  on_arm do
    url "https://pub-51b22bf3fd5a4d73a4ed580105cfc09f.r2.dev/v#{version}/HubDev-macos-arm64.dmg"
    sha256 "00ed0f316a95a78920f65d7a73e16a355f74a26ed79d305bc7056addc40e67b7"
  end

  on_intel do
    url "https://pub-51b22bf3fd5a4d73a4ed580105cfc09f.r2.dev/v#{version}/HubDev-macos-amd64.dmg"
    sha256 "0970c8c9bed3f415b344222123d77714fb1eaafe122d8a146b266703aea53ce5"
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
