cask "neovim-nightly" do
  version "nightly-1cb1cfead017df79aa590d1d297b116a85cb31c0"

  on_arm do
    sha256 "5155d58696bb67bf23b8694221e1455343dc34afebe13fc370b88d33f9351cef"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "79ba3fab2e22a1bb54a710b781999e53052fb3066ac8e41cbcc4a659df4c84ea"
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
