cask "neovim-nightly" do
  version "nightly-0f9aae20ec60262822ffd6a2a565628e20f4bcea"

  on_arm do
    sha256 "0759214b821292a793f0a2f3543640457e6ba532dd33cc0a475ec8cd616139c1"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "6ea75fae5bd93d023d2e01ca777b83d2ff9feb90143e9103ecb429523d44085e"
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
