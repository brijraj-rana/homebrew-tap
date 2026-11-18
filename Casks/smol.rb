cask "smol" do
  version "0.1.0"
  sha256 "257d870b139d91e5b4ae9fa3c8c29172f25294d8a90f165a75978fbe42f6e0bd"

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
