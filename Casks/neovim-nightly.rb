cask "neovim-nightly" do
  version "nightly-21f2c2b19c40882dc6985f87a2e3527c60e3cfaa"

  on_arm do
    sha256 "b4916511bc1686efe9fd17a82ca97bb5744ea15c5ea7b0c81e7faeba72e88276"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "14145a98fe2f52aa1657de1d6615bc47bab869b572297e90571d80e43be89472"
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
