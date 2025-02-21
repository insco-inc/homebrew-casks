cask "kitify" do
  version "0.0.1+3"
  sha256 "d14276ff705ee05d744f2ef46647e3d9882ee104d6d3f5334db08f15ef39b539"

  url "https://github.com/kitifylabs/kitify/releases/download/v#{version}/Kitify_#{version}_macos_universal.dmg",
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
