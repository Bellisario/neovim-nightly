cask "neovim-nightly" do
  version "nightly-f1d176d1ab6ef728996e6de75135b067465b8ece"

  on_arm do
    sha256 "bfd8a7754a9f8836d7df8e8a0f975826702c169496968b3d8410b7ed8cdc91be"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "0dff130e156d0d2d0687c703d2310759d029f9bab4ed5ac22107ba873b82b7e8"
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
