cask "neovim-nightly" do
  version "nightly-a897cc17a5ee9a3bf9a22eb105b15d2c162f7176"

  on_arm do
    sha256 "a7a025b6c74aa5ccebb03997ec46a4a8558bf45c72eb78555a141fd51993cb82"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "6c0f0d584b16cf4b4845a76eda2eea3683a7a0a2159485c51b1ffaf1abe02035"
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
