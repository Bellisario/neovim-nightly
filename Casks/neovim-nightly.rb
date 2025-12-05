cask "neovim-nightly" do
  version "nightly-903335a6d50b020b36d1c4d5e9da362c31439d6e"

  on_arm do
    sha256 "a0568e14de5860d9c45ff8c97e2d813a113e88606e9c091ebee9209f49a1f129"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "b7aac9cfae9cb1f8397b8a01b07f950a857e5fe9cb0e8a640c7994c8d095f888"
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
