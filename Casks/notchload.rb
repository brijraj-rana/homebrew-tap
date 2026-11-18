cask "notchload" do
  version "1.1.0"
  sha256 "7f8df8798b4bcdca58dbd53130b52e2da6d745e183e259f42f6926f537de43bf"

  url "https://github.com/brijraj-rana/notchload/releases/download/v#{version}/Notchload-#{version}.dmg"
  name "Notchload"
  desc "System load monitor under the MacBook notch"
  homepage "https://github.com/brijraj-rana/notchload"

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
