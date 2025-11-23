cask "neovim-nightly" do
  version "nightly-4bbdffe8298e8bf6e0590684092a25f5effc0f14"

  on_arm do
    sha256 "96f308290d73a3521cdbd338b003604a242754272ee51e573e10065844a91d56"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "80fb5dc96b21af40c2fbc22316c8ce760ec1c42cf37fcaf1587f15d6e97157ea"
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
