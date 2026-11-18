cask "launchcheck" do
  version "0.2.3"
  sha256 "934e434570d27f231b136509f252013ffe8874261943d8c849c3bd79e81b1c7a"

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
