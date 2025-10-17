cask "neovim-nightly" do
  version "nightly-a08aa77e4084e2b380f23b7a10f41eb20371d6c3"

  on_arm do
    sha256 "3cd9d5b72d7eeb2f26c8f4d5020150339faf5a1b4b689edb23034e1de27b7547"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "483ea41769916085f95bdbb9ec2ffbf9408516d0fa6139fc124d076b4e5e5be6"
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
