cask "launchwatch" do
  version "0.3.0"
  sha256 "f0295fdf43b610dbd57d62abb94ed366baca371ad35f0c3d2b7cdd65e5716ad8"

  url "https://github.com/BRIJRAJ-02/launchwatch/releases/download/v#{version}/Launchwatch-#{version}.dmg"
  name "Launchwatch"
  desc "Keeps checking live websites from the menu bar"
  homepage "https://github.com/BRIJRAJ-02/launchwatch"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Launchwatch.app"

  zap trash: [
    "~/Library/Application Support/Launchwatch",
    "~/Library/Preferences/com.brijraj.launchwatch.plist",
  ]

  caveats <<~EOS
    Launchwatch is signed ad hoc and not notarized, so macOS blocks the first launch.
    Open it once, then allow it under System Settings > Privacy & Security > Open Anyway.
  EOS
end
