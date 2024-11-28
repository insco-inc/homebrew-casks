cask "picguard" do
  version "1.0.7+429"
  sha256 "2d1267b3a3c1b0e92b8c9c50409dbc725577756142726c8c1b6c2d3338ff112b"

  url "https://github.com/picguard/picguard/releases/download/v#{version}/PicGuard_#{version}_macos_universal.dmg",
      verified: "github.com/picguard/picguard/"
  name "PicGuard"
  desc "Your pictures, your signature"
  homepage "https://picguard.app/"

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

  depends_on macos: ">= :catalina"

  app "PicGuard.app"

  zap trash: [
    "~/Library/Application Support/PicGuard",
    "~/Library/Caches/com.kjxbyz.picguard",
    "~/Library/Caches/PicGuard",
    "~/Library/Preferences/com.kjxbyz.picguard.plist",
    "~/Library/Saved Application State/com.kjxbyz.picguard.savedState",
  ]
end
