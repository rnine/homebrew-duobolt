cask "duobolt-desktop" do
  version "1.4.0"
  sha256 "e52dc475e2e9cd0c3f62cbf713dfed2051ce589168cb46ae70a3e682da5ce801"

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
