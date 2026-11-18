cask "portpeek" do
  version "0.2.0"
  sha256 "722af0938b05c3f9c396be871ac103a35d402644832b20969f81a5b0454dc4a7"

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
