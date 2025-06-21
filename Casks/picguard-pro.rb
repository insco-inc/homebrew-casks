cask "picguard-pro" do
  version "3.0.2+450"
  sha256 "bca745582064b6e2c0c46c42ad8975b67b765a304571613e9c9088f669bade18"

  url "https://github.com/picguard/picguard/releases/download/v#{version}/PicGuard-Pro-#{version.tr("+", ".")}-macos-universal.dmg",
      verified: "github.com/picguard/picguard/"
  name "PicGuard Pro"
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

  depends_on macos: ">= :big_sur"

  app "PicGuard Pro.app"

  zap trash: [
    "~/Library/Application Support/PicGuard Pro",
    "~/Library/Caches/com.kjxbyz.picguard.pro",
    "~/Library/Caches/PicGuard Pro",
    "~/Library/Preferences/com.kjxbyz.picguard.pro.plist",
    "~/Library/Saved Application State/com.kjxbyz.picguard.pro.savedState",
  ]
end
