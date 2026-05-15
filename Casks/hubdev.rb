cask "hubdev" do
  version "1.11.3"

  on_arm do
    url "https://pub-51b22bf3fd5a4d73a4ed580105cfc09f.r2.dev/v#{version}/HubDev-macos-arm64.dmg"
    sha256 "5f4da7c9057592abca7eee44c5fe189230f124d594fa46d7fe82d9909c1fca10"
  end

  on_intel do
    url "https://pub-51b22bf3fd5a4d73a4ed580105cfc09f.r2.dev/v#{version}/HubDev-macos-amd64.dmg"
    sha256 "b3cd5dfedba274bcc6b479e58fe7fc549a45f63bc2282a1cbaadcfd69d92f4e0"
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

  # Symlink the CLI into Homebrew's prefix so users can run
  #  from any shell after installing the cask. Without
  # this the binary is only reachable via the full bundle path
  # /Applications/hubdev.app/Contents/MacOS/hubdev, which is
  # what tripped up the MCP integration on Mac.
  binary "#{appdir}/hubdev.app/Contents/MacOS/hubdev"

  uninstall quit: "com.wails.devhub"

  zap trash: [
    "~/.local/share/hubdev",
    "~/Library/Application Support/hubdev",
    "~/Library/Preferences/io.hubdev.plist",
    "~/Library/Caches/hubdev",
  ]
end
