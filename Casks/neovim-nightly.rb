cask "neovim-nightly" do
  version "nightly-d40c07511ad220c08cd2803921346c889da74a44"

  on_arm do
    sha256 "b09af77c4a4d4fea086e96cd7216bf9bf4ed1607fa9e9ca02b9d38bb26b4d79c"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "7e1b6bf5528f521c165c741392500e954a48d1a02355c43f0f87dcd29063f4a8"
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
