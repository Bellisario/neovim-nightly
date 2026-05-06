cask "neovim-nightly" do
  version "nightly-d9a7b687955bd1af377dba56b87479acd7141f87"

  on_arm do
    sha256 "2a3af7b1eefe0acfcbbb7796369bfcb5638464c016c1535b4ff5ab7cc6616e4f"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "c87db2189e4e6c1008af2d6dca5fa479d5283315ba7ebb0434e4149cad332e7c"
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
