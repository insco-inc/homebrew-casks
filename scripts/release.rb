# frozen_string_literal: true

require "net/http"
require "json"
require "digest"

version = ARGV[0]
if version.nil?
  abort "Usage: release.rb [x.y.z]"
else
  version = version.gsub(/[a-z-]*/i, "")
end

puts "Releasing PicGuard on Homebrew: v#{version}"

url = "https://api.github.com/repos/picguard/picguard/releases/tags/v#{version}"
response = Net::HTTP.get_response(URI(url))
!response.is_a?(Net::HTTPSuccess) && abort("Did not find release: v#{version} [status: #{response.code}]")

release = JSON.parse(response.body)
puts "Found release: #{release["name"]}"

assets = {}
release["assets"].each do |asset|
  filename = asset["name"]
  unless filename.end_with?(".dmg")
    puts "Skipped asset: #{filename}"
    next
  end

  url = asset["browser_download_url"]
  loop do
    response = Net::HTTP.get_response(URI(url))
    break unless response.is_a?(Net::HTTPRedirection)

    url = response["location"]
  end

  !response.is_a?(Net::HTTPSuccess) && abort("Did not find asset: #{filename} [status: #{response.code}]")

  sha256 = Digest::SHA256.hexdigest(response.body)
  puts "Found asset: #{filename} [sha256: #{sha256}]"

  assets[filename] = sha256
end

cask = ""
File.open("Casks/picguard.rb", "r") do |file|
  file.each_line do |line|
    query = line.strip

    new_line = if query.start_with?("version")
      line.gsub(/"\d+(?:\.\d+)+(\+\d+)?"/, "\"#{version}\"")
    elsif query.start_with?("sha256")
      # arch = query[(query.index("#") + 2)..].strip
      asset = "PicGuard_#{version}_macos_universal.dmg"
      sha256 = assets[asset]

      !sha256 && abort("Did not find sha256: #{asset}")
      line.gsub(/"[A-Fa-f0-9]{1,}"/, "\"#{sha256}\"")
    else
      line
    end

    cask += new_line
  end
end

versioned = version.tr(".", "-").gsub("+", "-plus-")
versioned_class = "cask \"picguard@#{versioned}\""
versioned_cask = cask.gsub("cask \"picguard\"", versioned_class)
File.write("Casks/picguard@#{versioned}.rb", versioned_cask)
puts "Saved Casks/picguard@#{versioned}.rb"

File.write("Casks/picguard.rb", cask)
puts "Saved Casks/picguard.rb"

readme = File.read("README.md")
new_readme = readme.gsub(/picguard@\d+(?:-\d+)+(-plus-\d+)?/, "picguard@#{versioned}")
File.write("README.md", new_readme)
puts "Saved README.md"

puts "Done"
