cask "duobolt-desktop" do
  version "1.3.12"
  sha256 "5a96a774d103147c378d0e67ca76838f8d6dfb0d2766471be250670fbf3a3df8"

  url "https://duobolt.app/dl/macos/#{version}"
  name "DuoBolt"
  desc "Desktop duplicate file finder with a clear review-first cleanup workflow"
  homepage "https://duobolt.app"

  auto_updates true
  depends_on macos: ">= :big_sur"

  app "DuoBolt.app"

  zap trash: [
    "~/Library/Application Support/DuoBolt",
    "~/Library/Caches/io.qoncept.duobolt",
    "~/Library/Logs/DuoBolt",
    "~/Library/Preferences/io.qoncept.duobolt.plist",
  ]
end
