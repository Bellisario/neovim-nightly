cask "neovim-nightly" do
  version "nightly-aea69c660b5d1476133e0cdaf5b5d274a678df1d"

  on_arm do
    sha256 "ce05e706c2c384adb1cd48996cd169a583e9f4e17ad5f3623f3d39127aaecd51"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "8096740f848174b1ad31aab49ff4c9ce12194c41b5f58c7982b41cf14ebe82da"
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
