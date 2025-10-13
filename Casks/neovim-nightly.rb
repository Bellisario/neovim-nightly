cask "neovim-nightly" do
  version "nightly-7ac6e91d0636979681d565133ad00a6c4b0aa461"

  on_arm do
    sha256 "aab9e96cc22f85f3395af36f6f23becc2849532db7e29d4cbb55ed9544298cf1"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "d7e49c808c0a8c303ac778972a7406fbd09c946e9ccb63852a1fbc1a9b7156c7"
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
