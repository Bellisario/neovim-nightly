cask "neovim-nightly" do
  version "nightly-1a7ab1ab4754eb7c7f1dc305ae103d26e42485f4"

  on_arm do
    sha256 "e90f6dd6450948db380e6fdfccf186712c10176b77bf4909cf593c2f4abde998"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "89a72ed94d6699083c3f6056e275a6e0b3a2dbd7f6550ad05bf7d75a60998447"
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
