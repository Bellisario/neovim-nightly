cask "neovim-nightly" do
  version "nightly-6dd6c5b523b11a1316f7c161217bd7b97cdb8b39"

  on_arm do
    sha256 "34ecb383f5ae61eb077516a0ebf171b7164b5ca754f3e3ced656acb4dc363af5"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "78594e99550960d504f73c577ad4373298c1439bc8a2c2a1a5376405c991aa21"
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
