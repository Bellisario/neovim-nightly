cask "neovim-nightly" do
  version "nightly-53cbf66bd2b0d6963ab024733522ab97507af303"

  on_arm do
    sha256 "ef63148ab63380f66b512f76bce43d5398b29c0eaa2387d227e51bb7d4573aa8"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "e9fdec8e9ea80d7f8aa3bc326d9c38fdf45207cfce7f54445a4dfbdd16252a65"
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
