cask "artify" do
  version "0.0.1+3"
  sha256 "5a47155240875f27192231f3b2f40c2f2c51e3d739aeb83565f304ec55bdf5ab"

  url "https://github.com/artifylabs/artify/releases/download/v#{version}/Artify_#{version}_macos_universal.dmg",
      verified: "github.com/artifylabs/artify/"
  name "Artify"
  desc "Ideas, Painting & Art"
  homepage "https://artifylabs.org/"

  livecheck do
    url :url
    strategy :git do |tags|
      tags.filter_map do |tag|
        match = tag&.match(/^v?(\d+(?:\.\d+)+(\+\d+)?)$/i)
        next if match.blank?

        match[1]
      end
    end
  end

  depends_on macos: ">= :big_sur"

  app "Artify.app"

  zap trash: [
    "~/Library/Application Support/Artify",
    "~/Library/Caches/Artify",
    "~/Library/Caches/org.artifylabs.artify",
    "~/Library/Preferences/org.artifylabs.artify.plist",
    "~/Library/Saved Application State/org.artifylabs.artify.savedState",
  ]
end
