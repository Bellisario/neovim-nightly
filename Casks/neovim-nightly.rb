cask "neovim-nightly" do
  version "nightly-accd392f4d14a114e378f84dc15cb24bc34a370a"

  on_arm do
    sha256 "0856f9887ac53ff34ade3d97a89c66405d4b66165972213d7d218ea4f0630d36"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "3a942e7eabd69686aa7477c19dbcdb122140ee3795f50e7f0e6a23e5fe9ed0ab"
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
