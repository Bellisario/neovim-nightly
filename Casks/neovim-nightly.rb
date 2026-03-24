cask "neovim-nightly" do
  version "nightly-929f03fa8c6263044496b7c92af4058ac1c28ced"

  on_arm do
    sha256 "66abeb2d01ed1d3f83d16cec554af24df1bfb5bbb3e9e51c6a4b54d4d208f470"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "943645caea05ec67b064aa44d39a46ea6b54571a0a1900c2d37d2ebcbb5b72c7"
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
