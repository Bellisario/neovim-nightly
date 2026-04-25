cask "neovim-nightly" do
  version "nightly-f83d0b9653a8a548093645a9397f9f293b91c127"

  on_arm do
    sha256 "366e840b0eecb0bd19af7fb15b055ab42a812504a88f3f69e38d012f4ed8fc3d"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "ea80d70a010a9bc5493ac9f81cc91f5c4e52c1493b2b704ebeb2344a5e5661c4"
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
