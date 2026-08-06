cask "neovim-nightly" do
  version "nightly-54373e2453077578b72ff0aa88b2ddc9dced4585"

  on_arm do
    sha256 "e9dffaa0ffa2abfcbefcf4b722632fa73effe4a124cd928ac0f71786b6fcdf24"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "dba1641615a6462e3160f7f7355bfdaf55f46cf397d20c628d58eadee99a4c57"
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
