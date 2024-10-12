cask "picguard" do
  version "1.0.3+417"
  sha256 "22596e2aebf6bfbb6796f368e29a84430a9aeab69f56e9273db978789d3750ff"

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
    "~/Library/Caches/com.kjxbyz.watermarkassistant.mac",
    "~/Library/Caches/PicGuard",
    "~/Library/Preferences/com.kjxbyz.watermarkassistant.mac.plist",
    "~/Library/Saved Application State/com.kjxbyz.watermarkassistant.mac.savedState",
  ]
end
