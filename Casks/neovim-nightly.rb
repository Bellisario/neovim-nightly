cask "neovim-nightly" do
  version "nightly-4998b8d7b5f948a6584ae44902001fb1c2bac95d"

  on_arm do
    sha256 "f2b16d3a1294a90ffe638af376a38d0842d3bc2b83b06647a56525df593da06a"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "cc2c07a76d48953b5539f87f1d802be28ce5659d04e4b7099c89b0b84d18bbb5"
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
