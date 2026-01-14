cask "neovim-nightly" do
  version "nightly-dddc359213be522026d60ffd89867a0f52f19256"

  on_arm do
    sha256 "7fe4532a7ed49b69e9937653e277a1932270d8e87ff370a5c2e00ecd4be1e2a5"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "35f963c449f46a9915d90ebd1d8170014b6b976ce8b837afabe148a4071aaaa4"
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
