cask "neovim-nightly" do
  version "nightly-d7164eced6d6dc363eaee0c47538c5ff6552e3ba"

  on_arm do
    sha256 "199175e75e5ea4e7e1d38eeb64525ec7ea6080a24c618de064366609f505c943"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "afaed061b2dbf98a935aa790a8e2b71911237f13427dc625bcc02677c44fdddc"
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
