cask "neovim-nightly" do
  version "nightly-dd6ed202724891a3853c8766ece4a4c72d82adee"

  on_arm do
    sha256 "67334b2b0d568d63a3263c3e05f7ef426f21a27ff5482a277c431fa5cf2c100f"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "a313c975b80b8878edbcc1b84dcfd3f00c693b12dad74a60a758eeafa67fbce4"
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
