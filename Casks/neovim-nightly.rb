cask "neovim-nightly" do
  version "nightly-924dbf10b8e3bbc35eff629d12583bc9c944660b"

  on_arm do
    sha256 "1ef69a2ecc1c7227b1d5724226f261bf6a5676f11e6bebb38d7c32c33c8846f8"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "755d5f9d822ec1fdade167d81400daf718244d389aa2714d491da332b9aae284"
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
