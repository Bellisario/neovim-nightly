cask "neovim-nightly" do
  version "nightly-d7b882697b5dc307a6396ec6163e41dfc74b076d"

  on_arm do
    sha256 "665bcc6f7ccc159a12ab33b5ebb457a3051151fdb74fefd5b5c17c12413eb955"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "ec07e6c5f93898f3b2bd91066c8c2053422ff1360ad91f68c62e3cf8fde616fd"
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
