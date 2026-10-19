cask "grasslands" do
  version "0.1.1"
  sha256 "af490ae45cabb4df4e692d76b2680d7f2a465a91899507472148afd7a237542d"

  url "https://github.com/lklyne/grasslands/releases/download/v#{version}/grasslands-#{version}-arm64.zip"
  name "grasslands"
  desc "Native window for the herdr agent multiplexer"
  homepage "https://grasslands.dev/"

  livecheck do
    url :url
    strategy :github_releases
  end

  depends_on arch: :arm64
  depends_on formula: "herdr"
  depends_on macos: :ventura

  app "grasslands.app"

  zap trash: [
    "~/.config/grasslands",
    "~/Library/Application Support/grasslands",
    "~/Library/Logs/grasslands",
    "~/Library/Saved Application State/dev.lklyne.grasslands.savedState",
  ]

  caveats <<~EOS
    grasslands needs herdr 0.9.5. It attaches to herdr's terminals with
    --takeover, so a herdr TUI attached to the same panes loses them.
  EOS
end
