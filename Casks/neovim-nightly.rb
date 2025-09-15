cask "neovim-nightly" do
  version "nightly-1264d1156ce1830af8383d736a3f8bbc2b881563"

  on_arm do
    sha256 "81f2351de35418fc67c48af2057514cd985d1799b9fb62951d28d7582c84f495"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "f7b9396ca92167ae9f90d72563f4b74233d0bdb1a8b4bbfcfc0988acae382e62"
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
