cask "neovim-nightly" do
  version "nightly-8d2b50c0ce1f27aa90f5a1d8003574c76937ec8f"

  on_arm do
    sha256 "9c5bfa945d9d25bce35afc19b80cc2b6199d330d64e2ce1ada44ebcf85c1afa8"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "76d12aa5f0796078d364f3ec300e52f41b20cfd829f89a5aaed1f44a54ce7b97"
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
