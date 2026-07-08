cask "neovim-nightly" do
  version "nightly-6a6431cb99f411a85ffb3157023cd4726614485d"

  on_arm do
    sha256 "69964cbc81d208d28919fb3a6a2dc5f3e6fa5380f7bc7967d73e270ae5a22d83"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "e8d874e800d1c3cc2c5523bf84e5d7d997eb2f68edbdfe252266d525c1f3dfea"
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
