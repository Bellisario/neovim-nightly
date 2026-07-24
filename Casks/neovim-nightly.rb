cask "neovim-nightly" do
  version "nightly-e4137a73246f0867c222b15174174a5b4cf36f71"

  on_arm do
    sha256 "f86ea9332306487c6b79d6d95604603444dbca0bd55c0fede583e027cc4098a7"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "983e1c8414d9b1beb63f8c27dd5c85578dab6bdb8b4a9887aeee66110e907014"
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
