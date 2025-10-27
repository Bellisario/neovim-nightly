cask "neovim-nightly" do
  version "nightly-070f4d3da08c270b5360759a17ac3f210328f985"

  on_arm do
    sha256 "7652e79f48be43d3dce71b1a8b35c1373ad4362fd86eb5bcdf324346fe0fc4d3"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "b82ff2dcc9c044e58911b11eb555884e93d8736b6fca6ad491f288a5262f903b"
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
