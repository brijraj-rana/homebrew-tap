cask "launchcheck" do
  version "0.3.1"
  sha256 "b003804492f5111a6012bf2ee42ab68628c79b86a5818023f3f20a54f2c5fccb"

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
