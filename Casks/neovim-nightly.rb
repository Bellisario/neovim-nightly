cask "neovim-nightly" do
  version "nightly-f67306cc67e85bd3cc064dc470bfa3070deafcdc"

  on_arm do
    sha256 "da255ee198d07683c0f8bc72d1c94c033a4f4620804c66d770db03a13b453148"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "4210845814fab500046dc45c2dd1ca7ee0ca2db93f1b44f30f6e500fb3f92d65"
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
