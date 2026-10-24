cask "neovim-nightly" do
  version "nightly-7b87ce822e6fd45a4d9993599c2854afdb0dc4dd"

  on_arm do
    sha256 "2663a879db6f59e120b42af3a2bedfa1644cd3606a43196f1f524dc4df63f45e"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "f9da155f6d67bddac39b04069b49fb4bf780e0670e38f97b49a2a69d83a1e23c"
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
