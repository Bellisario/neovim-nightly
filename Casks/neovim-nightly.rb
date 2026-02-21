cask "neovim-nightly" do
  version "nightly-d79a9dcd422133bc1e4b4ef94444962560d7a6d7"

  on_arm do
    sha256 "0612c94d9a79b38dcfc5a9c041ed62a26a95a625372cfda8a085154081a9de52"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "6de56c170c9def680ac4f8b054dc1edf5fdbe6880f05ddc61b42c5e20f4fd43b"
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
