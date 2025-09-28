cask "neovim-nightly" do
  version "nightly-fcf752476a33a26058b3342ac09108f76801bd4b"

  on_arm do
    sha256 "f000c1fe5bf568d8f2d0cf8fb3f12cd560e96d3f4c5490e369513275ea8efa6a"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "04f7bc6ce3edeeed5d4eb29b7a02a0cb6092824c26920deb8cde5a8cffada5be"
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
