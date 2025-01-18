cask "kitify" do
  version "0.0.1+1"
  sha256 "44bd3b0249c17c70f44eb8f4c472cd738224b3db80b429cc6be70a002e4d41f2"

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
