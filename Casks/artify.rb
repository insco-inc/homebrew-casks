cask "artify" do
  version "0.0.1+5"
  sha256 "e7785282dd78ec5d587f53310a313d70fc260cbbd5127cc52fb78120b27ff51e"

  url "https://github.com/artifylabs/artify/releases/download/v#{version}/Artify-#{version.tr("+", ".")}-macos-universal.dmg",
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
