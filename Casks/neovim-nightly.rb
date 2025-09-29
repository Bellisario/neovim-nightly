cask "neovim-nightly" do
  version "nightly-9da316fcc45c34ec47e95f50e28865c3ec3ba15b"

  on_arm do
    sha256 "503ac62f465be3ae78b283ec97db9ff4d3583d56252a46746cc21eb0f651fec2"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "5e8b575a60a01a7037ac9f40fd9b592d94a5abdec65f26f83307c19877ace667"
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
