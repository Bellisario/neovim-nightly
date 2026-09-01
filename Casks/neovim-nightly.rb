cask "neovim-nightly" do
  version "nightly-ca992e82d40cb8ed31331ba75cf0a58c6d693ac7"

  on_arm do
    sha256 "1fdf73803839934f542d18b36891e27acb251f9edc4c9b61e40e9de4dad90a90"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "c095135c7f76ccff53c09f76386ef7d075d2fe9c6663ea4667fc74e2837b08fe"
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
