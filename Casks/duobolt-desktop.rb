cask "duobolt-desktop" do
  version "1.3.14"
  sha256 "675673182329dc612e7cbb0dfee1bed53987d293224170d65e3e9f7d0a48c1e0"

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
