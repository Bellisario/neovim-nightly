cask "neovim-nightly" do
  version "nightly-02e10d5101da33bde6e050c258ccf29ae6d858c9"

  on_arm do
    sha256 "371dcbc726ccf23234484c7483c0bb51783ae04ab2d3463ca9bb11302e74ab11"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "ddb60f51d2f51e03b8b04d178225b0a8dffffd9e27605009a7a1a65b603abaab"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-x86_64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-x86_64/bin/nvim"
  end

  name "Neovim"
  desc "Vim-fork focused on extensibility and usability"
  homepage "https://neovim.io"

  caveats <<~EOS
    This cask conflicts with the neovim formula. You should uninstall it with
    `brew uninstall neovim` before installing this cask.
  EOS

  postflight do
    system_command "xattr", args: ["-cr", "#{staged_path}"]
  end
end
