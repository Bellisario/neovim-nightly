cask "neovim-nightly" do
  version "nightly-70958dae75efc797fe85b29df11fb2ea2ebf9401"

  on_arm do
    sha256 "f3406fb6ff700ac2986d75920ac50d43ee5388b669a9382ff11209ebdc6c6156"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "acc4b92f3f08a4375e758c67c45bb0266857046692297c41f4dd2ae8ef6311a9"
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
