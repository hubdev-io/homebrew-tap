cask "devhub" do
  version "1.9.8"

  on_arm do
    url "https://pub-51b22bf3fd5a4d73a4ed580105cfc09f.r2.dev/v#{version}/DevHub-macos-arm64.dmg"
    sha256 "a472f3cfb4cb686961f66e8604aed1e00237774461a342f265805329bd13603c"
  end

  on_intel do
    url "https://pub-51b22bf3fd5a4d73a4ed580105cfc09f.r2.dev/v#{version}/DevHub-macos-amd64.dmg"
    sha256 "e83cc5313c93cbda87f8aac28af61097305f6f26d28a592b53b2a5d8fe4c4a78"
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
