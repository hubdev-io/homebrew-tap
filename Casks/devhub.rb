cask "devhub" do
  version "1.9.3"

  on_arm do
    url "https://pub-51b22bf3fd5a4d73a4ed580105cfc09f.r2.dev/v#{version}/DevHub-macos-arm64.dmg"
    sha256 "24c68d7a7cedd4d761e1ff9f586fa4cef909e2bcc1db2fab7041b5fe08906080"
  end

  on_intel do
    url "https://pub-51b22bf3fd5a4d73a4ed580105cfc09f.r2.dev/v#{version}/DevHub-macos-amd64.dmg"
    sha256 "fc65af867084a6a0f6ef861cc846159ea01e990826f5a81c3f3ec4b132a7ecaf"
  end

  name "DevHub"
  desc "Hybrid Development Environment Manager — manage local dev services with a native GUI"
  homepage "https://hubdev.io"

  app "devhub.app"

  zap trash: [
    "~/.local/share/devhub",
    "~/Library/Application Support/devhub",
    "~/Library/Preferences/io.hubdev.devhub.plist",
  ]
end
