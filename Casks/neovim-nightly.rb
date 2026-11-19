cask "neovim-nightly" do
  version "nightly-158f7d603ec717d36e9f367a462aebf125f64fba"

  on_arm do
    sha256 "7f4ba48822fa5943836e4a304fbfaa0f7b0f771ebaa0e1a0479bf889794e5beb"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "7e624f6c840807e6722a87335936f2558521c7c83367631c28e12f07ae71b2df"
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
