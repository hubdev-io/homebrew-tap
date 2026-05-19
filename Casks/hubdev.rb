cask "hubdev" do
  version "1.15.0"

  on_arm do
    url "https://pub-51b22bf3fd5a4d73a4ed580105cfc09f.r2.dev/v#{version}/HubDev-macos-arm64.dmg"
    sha256 "fd0ec38bb52347cc01a3d691eb666eb4b44d89ad0c634b03e10d7f52250112d9"
  end

  on_intel do
    url "https://pub-51b22bf3fd5a4d73a4ed580105cfc09f.r2.dev/v#{version}/HubDev-macos-amd64.dmg"
    sha256 "0d35418662c6caa2628dc86652589ff0cc28f0fee9454b6cc76f2aa927da530b"
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
