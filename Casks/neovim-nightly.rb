cask "neovim-nightly" do
  version "nightly-2822c38f2e737e9b249d2dc7b09eedd03dcc077c"

  on_arm do
    sha256 "593299d281e7894bdf9a10fcddb0e82cbe1cd56fa99c06e363ba32bdd1005ba4"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "c78c4b00bd526f51a644a062244d68d346b313b5200dd3168c62a5229d694087"
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
