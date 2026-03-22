cask "neovim-nightly" do
  version "nightly-256811a617cbe97aa1dd2b3eef3b69b90608d54c"

  on_arm do
    sha256 "51bb1dcb58b75f90ebb0d6aaedc43391c387b75698bd9fc550df8137e0a716d9"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "4eeab443a9ad9243c8cd7bc90a0c545a3d3e544406fa299f4ddb92d2250a4f19"
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
