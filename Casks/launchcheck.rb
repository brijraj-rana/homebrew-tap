cask "launchcheck" do
  version "0.3.0"
  sha256 "bba791384b887fb1bf97313e8271cefab234ec9a81a9f9ba076d7ffd2f90d336"

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
