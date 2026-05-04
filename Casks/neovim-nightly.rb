cask "neovim-nightly" do
  version "nightly-7fff439395215001ab74a96cc3df3d1b6d795177"

  on_arm do
    sha256 "63563d7ce7f77e0ba1d4353e7df4ccf0ac1fd6630ff72bbbba220baf2b0e6168"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "5e29cbc9aa0489a9b93b9a35c0c3fe0910f6208cb9a11c1517b037e0b6d3f528"
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
