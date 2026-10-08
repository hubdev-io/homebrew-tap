cask "hubdev" do
  version "1.32.0"

  on_arm do
    url "https://pub-51b22bf3fd5a4d73a4ed580105cfc09f.r2.dev/v#{version}/HubDev-macos-arm64.dmg"
    sha256 "22f69dacbdf8a458eda4b6afa6f1ae383be2f9f3f6c3d10b22320ec27656a04c"
  end

  on_intel do
    url "https://pub-51b22bf3fd5a4d73a4ed580105cfc09f.r2.dev/v#{version}/HubDev-macos-amd64.dmg"
    sha256 "5f3b5bdd8cfa2a558ef028f1ecccfc0626e267b03cf642e0fa99e2dd612a0061"
  end

  name "HubDev"
  desc "Hybrid Development Environment Manager — manage local dev services with a native GUI"
  homepage "https://hubdev.io"

  livecheck do
    url "https://github.com/hubdev-io/devhub/releases/latest"
    strategy :header_match
  end

  # No auto_updates flag: HubDev does not silently self-update.
  # The in-app Update button runs brew upgrade; flagging the
  # cask auto_updates would make brew upgrade skip it (exit 0,
  # nothing done) and trap users in a relaunch loop.
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
