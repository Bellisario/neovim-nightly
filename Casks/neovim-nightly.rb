cask "neovim-nightly" do
  version "nightly-88dc44260f833db66ed3d9fa4950345ea34efd72"

  on_arm do
    sha256 "e0fbdca44156c0bf2e742d26472e549020ca91f4ba0ef969f52fd3a3e9c7d791"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "35c5aed32b16d3339feaf4744c8d8856c1f0adb1eb88ebe8864cc5350f44f0f2"
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
