cask "devhub" do
  version "1.9.1"

  on_arm do
    url "https://github.com/hubdev-io/devhub-go/releases/download/v#{version}/DevHub-arm64.dmg"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  end

  on_intel do
    url "https://github.com/hubdev-io/devhub-go/releases/download/v#{version}/DevHub-amd64.dmg"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
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
