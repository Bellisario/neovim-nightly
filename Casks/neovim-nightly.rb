cask "neovim-nightly" do
  version "nightly-0be3dee44f0659be58d455b067d1919525e773ee"

  on_arm do
    sha256 "b81696e7d39b4a06ba268bc64e75c65e73296d6f67aa85495c3dbd241f2eb98d"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "3021eac7383347fe7018bcae58993f7d27d9ff95aa94fc8d269a34b412f2be7c"
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
