cask "neovim-nightly" do
  version "nightly-30259d6af79e731491e6b12d815893b1b130b52b"

  on_arm do
    sha256 "5f404f4c34c96a4f4c67e99b092147771cd97a47106f00ba48917faf72c5e2aa"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "0deedeb47975b7979704f0ef2565e2bcb3d4139bc8a2e144745a2e3fa6e2ef4a"
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
