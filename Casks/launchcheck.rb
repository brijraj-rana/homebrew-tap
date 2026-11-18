cask "launchcheck" do
  version "0.4.0"
  sha256 "e2a235ee3876527f11c343edafe893d67cbb549d5034a2c9eb5ed1e46e6d0cd6"

  url "https://github.com/BRIJRAJ-02/launchcheck/releases/download/v#{version}/Launchcheck-#{version}.dmg"
  name "Launchcheck"
  desc "Checks a website for SEO mistakes before it goes live"
  homepage "https://github.com/BRIJRAJ-02/launchcheck"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Launchcheck.app"
  binary "#{appdir}/Launchcheck.app/Contents/Resources/launchcheck-cli", target: "launchcheck"

  zap trash: [
    "~/Library/Application Support/Launchcheck",
    "~/Library/Preferences/com.brijraj.launchcheck.plist",
  ]

  caveats <<~EOS
    Launchcheck is signed ad hoc and not notarized, so macOS blocks the first launch.
    Open it once, then allow it under System Settings > Privacy & Security > Open Anyway.
  EOS
end
