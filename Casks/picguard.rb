cask "picguard" do
  version "3.0.1+449"
  sha256 "ec34bb4ded834b8f1e159fd0a880d323e1f54aeb4d268864a81c72524d6d55ca"

  url "https://github.com/picguard/picguard/releases/download/v#{version}/PicGuard-#{version.tr("+", ".")}-macos-universal.dmg",
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

  depends_on macos: ">= :big_sur"

  app "PicGuard.app"

  zap trash: [
    "~/Library/Application Support/PicGuard",
    "~/Library/Caches/com.kjxbyz.picguard",
    "~/Library/Caches/PicGuard",
    "~/Library/Preferences/com.kjxbyz.picguard.plist",
    "~/Library/Saved Application State/com.kjxbyz.picguard.savedState",
  ]
end
