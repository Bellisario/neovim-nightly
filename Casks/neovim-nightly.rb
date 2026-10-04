cask "neovim-nightly" do
  version "nightly-fb1f321b0efb31101891ec6cc93d4087bc4ee325"

  on_arm do
    sha256 "4ab47df6c05875da7fe143afbc7cafb121742ab5de1ebebc04422f6f0c4cfffa"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "28e87a8bdab7fe5d53a679302fa5248e3a493f498a9e4b91f09abddff4e3bed4"
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
