cask "neovim-nightly" do
  version "nightly-f50ec42da2e56f72cee22806afd3c3112201e4da"

  on_arm do
    sha256 "be199b63d2131be4455d21cb2b0777e11b9dd5eb57e53a1e0f71f5675e2b40be"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "914a4b5f2fc891b883edb514f9c3ff10604ce7bc40060154f0d29a90ab412cbd"
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
