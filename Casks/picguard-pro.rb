cask "picguard-pro" do
  version "5.0.2"
  sha256 "53dbe29580fa67b31f395527f16d96c89f7e3f4eab3cfd159162f672d00b3911"

  url "https://github.com/picguard/picguard/releases/download/v#{version}/PicGuard-Pro-#{version}-macos-universal.dmg",
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
