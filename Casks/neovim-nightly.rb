cask "neovim-nightly" do
  version "nightly-272ec9627c957c1382fcc8157ef374ef41c33aeb"

  on_arm do
    sha256 "194e93f2317f5b85ef047f9628ae5aeb0d44455acccce2dbd8f24ad4dff98ea1"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "7da0aacd41fac7bfb709de05b86140891a587d1ee4d97456beb4a0b5c9b4e342"
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
