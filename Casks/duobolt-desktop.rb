cask "duobolt-desktop" do
  version "2.0.2"
  sha256 "f4675876f3bb81e49dd9fa6ac7ccd767094c956b8c3dff2e6b6388ec07527510"

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
