cask "neovim-nightly" do
  version "nightly-d017f3c9a0b745e0c57feb8c92dcc852948f7301"

  on_arm do
    sha256 "a58d659d7244242ed132c2d03593218d364e992209321d92ee82c1e6e46aa3c8"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "00851b16bde040a708aa5554ec11cd7508a5edebf6130ba1bb8ab18dd3edebd9"
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
