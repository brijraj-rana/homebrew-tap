cask "notchload" do
  version "1.0.1"
  sha256 "35d7bfbf01489bfc8c9b677d0835d398f368b311e608f340f3170f26e32fea74"

  url "https://github.com/BRIJRAJ-02/notchload/releases/download/v#{version}/Notchload-#{version}.dmg"
  name "Notchload"
  desc "System load monitor under the MacBook notch"
  homepage "https://github.com/BRIJRAJ-02/notchload"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Notchload.app"

  zap trash: "~/Library/Preferences/com.brijraj.notchload.plist"

  caveats <<~EOS
    Notchload is signed ad hoc and not notarized, so macOS blocks the first launch.
    Open it once, then allow it under System Settings > Privacy & Security > Open Anyway.
  EOS
end
