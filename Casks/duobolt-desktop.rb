cask "duobolt-desktop" do
  version "2.2.8"
  sha256 "380754f0815560a25a2b6a0b9010b67b5dfc6453e4ed8ad7395658064a1fc2ed"

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
