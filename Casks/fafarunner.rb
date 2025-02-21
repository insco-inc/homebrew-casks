cask "fafarunner" do
  version "1.0.10+376"
  sha256 "714d6dbbe6ab12d0a602be80b39fe3bcded6aef14c8ff0e1f709a9b39449d786"

  url "https://github.com/fafarunner/fafarunner/releases/download/v#{version}/FaFaRunner_#{version}_macos_universal.dmg",
      verified: "github.com/fafarunner/fafarunner/"
  name "FaFa Runner"
  desc "Enjoy smooth gameplay, stunning graphics, and endless fun"
  homepage "https://fafarunner.com/"

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

  app "FaFa Runner.app"

  zap trash: [
    "~/Library/Application Support/FaFa Runner",
    "~/Library/Caches/com.chenyifaer.fafarunner",
    "~/Library/Caches/FaFa Runner",
    "~/Library/Preferences/com.chenyifaer.fafarunner.plist",
    "~/Library/Saved Application State/com.chenyifaer.fafarunner.savedState",
  ]
end
