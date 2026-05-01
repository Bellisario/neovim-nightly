cask "neovim-nightly" do
  version "nightly-858cd3d106ca8a7910968dc6bb2dbf4469da342d"

  on_arm do
    sha256 "2befd57e7a6a43567e9961bba317012724f9d1d0b0b384dbfb38144bab1f3d72"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "14451ad92912f441d95c79be88ddba7b889f2c0625d344db56d5a36f46a78969"
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
