cask "kitify" do
  version "0.0.1+4"
  sha256 "2dd622c007850975a205181fb1dde78c329ad7a69e18ff22b7932c78ad1d258b"

  url "https://github.com/kitifylabs/kitify/releases/download/v#{version}/Kitify-#{version.tr("+", ".")}-macos-universal.dmg",
      verified: "github.com/kitifylabs/kitify/"
  name "Kitify"
  desc "All-in-one tools, boosting your efficiency"
  homepage "https://kitifylabs.com/"

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

  app "Kitify.app"

  zap trash: [
    "~/Library/Application Support/Kitify",
    "~/Library/Caches/com.kitifylabs.kitify",
    "~/Library/Caches/Kitify",
    "~/Library/Preferences/com.kitifylabs.kitify.plist",
    "~/Library/Saved Application State/com.kitifylabs.kitify.savedState",
  ]
end
