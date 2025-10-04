cask "neovim-nightly" do
  version "nightly-96e9041a7886ca56bc0e59d1d76acf6110aa7e6e"

  on_arm do
    sha256 "fedd08b389b145717d2b8d4fd6127d92bad0f14f3da1afbb06480a9443000361"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "0f506bcdf165f1649f6f050e998b7d8f6e52a30ffd2936cabf9067a427bb5a97"
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
