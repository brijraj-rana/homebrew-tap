cask "notchshelf" do
  version "0.2.0"
  sha256 "2c5a5d1193621c45d18b2361f4b0583410ee425a31d675ac9eeb380663147e0e"

  url "https://github.com/BRIJRAJ-02/notchshelf/releases/download/v#{version}/Notchshelf-#{version}.dmg"
  name "Notchshelf"
  desc "File shelf under the MacBook notch"
  homepage "https://github.com/BRIJRAJ-02/notchshelf"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Notchshelf.app"

  zap trash: [
    "~/Library/Application Support/Notchshelf",
    "~/Library/Preferences/com.brijraj.notchshelf.plist",
  ]

  caveats <<~EOS
    Notchshelf is signed ad hoc and not notarized, so macOS blocks the first launch.
    Open it once, then allow it under System Settings > Privacy & Security > Open Anyway.
  EOS
end
