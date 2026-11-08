cask "neovim-nightly" do
  version "nightly-c868e1ab3d11ac2a0cc3c284b16808f3de5adf31"

  on_arm do
    sha256 "a3e7851be5124bd55fac1de82ac1d4200fef4c7a3bf1805e5707067cb70b78a4"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "c0b08f3972c2c52a49c30a6b2b035933bdf7861df027ed650ea8f75b69c30531"
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
