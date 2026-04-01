cask "hubdev" do
  version "1.9.20"

  on_arm do
    url "https://pub-51b22bf3fd5a4d73a4ed580105cfc09f.r2.dev/v#{version}/HubDev-macos-arm64.dmg"
    sha256 "c79a16d83602249ffb2466de45c733354f696f758e3e1d58ef86518e31ad062e"
  end

  on_intel do
    url "https://pub-51b22bf3fd5a4d73a4ed580105cfc09f.r2.dev/v#{version}/HubDev-macos-amd64.dmg"
    sha256 "81dc31cfcd50b95e84f0d568dfe364d639a9717c9b1c48b4000a4e0f70c1fb81"
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
