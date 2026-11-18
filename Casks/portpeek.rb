cask "portpeek" do
  version "0.3.0"
  sha256 "410a05ef61722e4f9fa5075f31fa30ec4ec6466ca523136c295600d9b73d2903"

  url "https://github.com/brijraj-rana/portpeek/releases/download/v#{version}/Portpeek-#{version}.dmg"
  name "Portpeek"
  desc "Lists listening localhost ports from a screen corner"
  homepage "https://github.com/brijraj-rana/portpeek"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Portpeek.app"

  zap trash: "~/Library/Preferences/com.brijraj.portpeek.plist"

  caveats <<~EOS
    Portpeek is signed ad hoc and not notarized, so macOS blocks the first launch.
    Open it once, then allow it under System Settings > Privacy & Security > Open Anyway.
  EOS
end
