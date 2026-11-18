cask "notchshelf" do
  version "0.3.0"
  sha256 "7f0ddb67acfd5116c59f18952d2a006fa11488ae08bf900b0c45ade091a271b2"

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
