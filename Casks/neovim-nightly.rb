cask "neovim-nightly" do
  version "nightly-b8e3f3f4e0c3c9b4820ec336b88dc40a62c7e724"

  on_arm do
    sha256 "bfe4e47dca736bfc3b72770992dee4cde0e49e82a8f0711e111a207ce70299d6"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "7406b8011267eca58daac8e767fe55e6058e0e251570f677ed3cc00a9e290bd2"
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
