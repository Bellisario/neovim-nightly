cask "neovim-nightly" do
  version "nightly-6eb36bcb2de9cb066e8169daed053c77eb7667ed"

  on_arm do
    sha256 "1424d55e89cf92ab78bef8530c9dc7f0f658e688bb53393203dae87f7691bfb0"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "889041ee39bee72632e27c174e9ecbd012a5b7826b881edc2548a2cdafc6344d"
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
