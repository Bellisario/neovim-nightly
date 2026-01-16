cask "neovim-nightly" do
  version "nightly-43339dee40aa7731cc644315c15080e30aa1a67c"

  on_arm do
    sha256 "7fe0e44a8fbc79932be04c2bc3cab98c0c48b26e119d7c040f7922f675bf4fa6"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "74e78ec4dda4f5182942bc35c175f652c3a4bd0dc29433640c110ca470d08047"
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
