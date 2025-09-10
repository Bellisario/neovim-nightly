cask "neovim-nightly" do
  version "nightly-16018b111788e349cc2439da07d7c19485a42ee3"

  on_arm do
    sha256 "7e47ed432e22d2e8ea17fe49c633f59c7ab92c165eca6fb2961624e768ef8e27"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "c9e7b20e5d87494c9d9277c5dd45a5f1a4d6090d8664ea6ba03f3896c74d8236"
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
