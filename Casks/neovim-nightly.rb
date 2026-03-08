cask "neovim-nightly" do
  version "nightly-e8e694d837427bd158d51dd62a25f165d49725c6"

  on_arm do
    sha256 "9e114e1bcf9a6d84046bedfe1f53669b47dd4936ebf360cbc1ff1c994d02a58e"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "efbc6a8a4bfa68fe4615442b01515655f40d5f275cd43bf92e0dd489437fb679"
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
