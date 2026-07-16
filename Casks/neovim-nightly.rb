cask "neovim-nightly" do
  version "nightly-1741da8412134fc5a2f83e509da925c4e2d65034"

  on_arm do
    sha256 "f0d950f2c04a1c05bd7bfca521a1c28c4f8a2c0e4f194320b339e9632a91eb1a"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "8e0360ec0afcb9bfcd853140c956c18c045aa91770f0b07f18b401472e2299c6"
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
