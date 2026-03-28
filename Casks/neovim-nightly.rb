cask "neovim-nightly" do
  version "nightly-f027f41e2cfba7be8c4841cb1a036827375bbd73"

  on_arm do
    sha256 "f4940e75d86888314f75ec72f786c8c55821f47cb612bc07c2087e2f99a9b6cd"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "4cda92e1944ce6370f4b84a62611c652c2448f4479adf54cfbd84deb0f8077cb"
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
