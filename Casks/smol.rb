cask "smol" do
  version "0.2.0"
  sha256 "cd8b951b628fc122c1992b93d71c89b320c3dc344c14622f85f41426562ceccf"

  url "https://github.com/BRIJRAJ-02/smol/releases/download/v#{version}/Smol-#{version}.dmg"
  name "Smol"
  desc "Image compressor with a dial for an interface"
  homepage "https://github.com/BRIJRAJ-02/smol"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Smol.app"
  binary "#{appdir}/Smol.app/Contents/Resources/smol-cli", target: "smol"

  zap trash: "~/Library/Preferences/com.brijraj.smol.plist"

  caveats <<~EOS
    Smol is signed ad hoc and not notarized, so macOS blocks the first launch.
    Open it once, then allow it under System Settings > Privacy & Security > Open Anyway.
  EOS
end
