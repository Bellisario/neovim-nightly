cask "neovim-nightly" do
  version "nightly-d36d05cbd59a3accc4bc41f561b81187a3071d93"

  on_arm do
    sha256 "b9a4ec806e3f51e5f05af86238665c81d0d504cd3182e27e5b6acc5e19d5f307"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "d38c6125b793008bfbc6c7f8282f0603843db9a2e82b98a72f618017140e5dbd"
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
