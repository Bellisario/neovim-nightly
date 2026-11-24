cask "neovim-nightly" do
  version "nightly-6501a7547d7f6e6ec42a5b41ca14a64931d75ecb"

  on_arm do
    sha256 "ed015fdc35de13b5e0f009a71e345a870ba2c1fd77a13aef8fbce528cef97b68"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "0b7927c3f38d6435ae3eac1192660f67cfb297be50a7071639de2461ce1c4cbe"
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
