cask "hubdev" do
  version "1.9.12"

  on_arm do
    url "https://pub-51b22bf3fd5a4d73a4ed580105cfc09f.r2.dev/v#{version}/HubDev-macos-arm64.dmg"
    sha256 "a26fcd4cb9c31c305cbfc3b134c1916c33444cbb6b10cc4253c91b079add73d3"
  end

  on_intel do
    url "https://pub-51b22bf3fd5a4d73a4ed580105cfc09f.r2.dev/v#{version}/HubDev-macos-amd64.dmg"
    sha256 "78b90a845c2e75cbd9f441de97d7650c22882c84ab31a385141fcf17bd9bfadc"
  end

  name "HubDev"
  desc "Hybrid Development Environment Manager — manage local dev services with a native GUI"
  homepage "https://hubdev.io"

  app "hubdev.app"

  zap trash: [
    "~/.local/share/hubdev",
    "~/Library/Application Support/hubdev",
    "~/Library/Preferences/io.hubdev.plist",
  ]
end
