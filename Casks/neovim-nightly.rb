cask "neovim-nightly" do
  version "nightly-08c64bb03684597236680af72d3983a923fecd3e"

  on_arm do
    sha256 "600f2a62e4871d7b270589d37500b9920c6c125aa92e9f8e85f7c4e2479f51fc"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "159fd0e35840d6b535dd562dfbed085d0b86ed3d9ceb2626ce05a9c309d8e209"
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
