cask "neovim-nightly" do
  version "nightly-510f61555b9da5800ccd13de2336c90a64c0b9a5"

  on_arm do
    sha256 "42ae601e007cd0d690f6c109a6075435ae6b5f50cc2cf5cb54c356d2d8304164"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "34a4cfcced6dfe29e0748faad9136fc59ebf79c1d19072831e4c7981c26c1109"
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
