cask "artify" do
  version "0.0.1+1"
  sha256 "4920f272d1cf397fc320d5293126b79e6d05367ca476bbc71dad5e391826c48d"

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
