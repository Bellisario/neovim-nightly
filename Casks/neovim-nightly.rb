cask "neovim-nightly" do
  version "nightly-2abea5dc37734aeb349b52b29eadccc9209fa3bf"

  on_arm do
    sha256 "fead3cc4b0f0933b8ecafbf715f0d805cadda32f8e99e25effe7c252e01904fe"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "8268bc2f98d4da9d8bd51d9409599195fa8321da5967a5be5027a66e2a79b068"
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
