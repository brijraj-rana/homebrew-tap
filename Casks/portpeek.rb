cask "portpeek" do
  version "0.1.0"
  sha256 "fefad4e209f580e87acc4692f011abffef9e208d029105cfbb20552003b81b11"

  url "https://github.com/BRIJRAJ-02/portpeek/releases/download/v#{version}/Portpeek-#{version}.dmg"
  name "Portpeek"
  desc "Lists listening localhost ports from a screen corner"
  homepage "https://github.com/BRIJRAJ-02/portpeek"

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
