cask "neovim-nightly" do
  version "nightly-89370c06d73b471187e1c43743ce01bb8bd7e8d4"

  on_arm do
    sha256 "7981a6b7f98ac8c487d1163c8e9d8b82680acf635a55a53f0fbc68b8449b3a39"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "0c6c265a3e502f37d08f970e6fde4a65c4374e090ba2b953f2cbbd8240d2fab9"
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
