cask "neovim-nightly" do
  version "nightly-63ece2b151e3d051d9366452441f64430ae5b45e"

  on_arm do
    sha256 "aacd9716bdc9f1b5a991fcca3c6b93873dd5f467442216c25bddbe27e6065256"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "2f04635ff2cf5369fdc10e35ee4a3f57cbbc61a4aa41a71ce92ea9a3092efa2e"
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
