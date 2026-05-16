cask "neovim-nightly" do
  version "nightly-1813e1c089bbcef54ee34d8807c3798e45bbc146"

  on_arm do
    sha256 "5036b6a2aa6b70bc8dea9612f195efab17a6ce4b9f163892f0b342cef0691c12"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "ab314971fb42ef6d12607b43c259aa8222846c715a435aeb569f5c0ce07ccee6"
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
