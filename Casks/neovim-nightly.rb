cask "neovim-nightly" do
  version "nightly-318ea4de21121a8ca0d905289a96cf48d9025816"

  on_arm do
    sha256 "50ed3777d7f99f3912418061c7f72520e75b3bc9722a0abac072ae72762ef6b4"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "0a6c7cbb98e84b3a26fd48d9cda76a4d04d499e811162d5e1bf4eab47c3af655"
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
