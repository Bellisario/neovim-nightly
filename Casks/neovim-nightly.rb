cask "neovim-nightly" do
  version "nightly-0976ce255bebb5d44d07bbda51233d7002588ae1"

  on_arm do
    sha256 "88fd437ddf2ec492b9f55bb350c9f72fa11d7c52975ffbbb2557e5ccf614aec7"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "bb040fa569b4a1d594784caab771991b44772b2131fa338aa4db0b5c43714775"
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
