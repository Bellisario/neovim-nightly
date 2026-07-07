cask "neovim-nightly" do
  version "nightly-5231ad13574a4c5ef65c4480165c984a6e83d0dc"

  on_arm do
    sha256 "ed67b5311063dbd35932b109929f2e9c5659155a4683739e7f88ce8ec676d761"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "450cd50f2ce0546c11b49572601cb7ea9036ebeede9fbd6229e2971867fbbd80"
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
