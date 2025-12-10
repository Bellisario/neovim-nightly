cask "neovim-nightly" do
  version "nightly-c40cb2a4cf324812d46479480f6065e2c28bcb80"

  on_arm do
    sha256 "eea3fbf4c49ab68c22b6fd41144ee0f80de690c3e8f024628a182c2856316124"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "0f7a3c56163e622309c4e2a4772a4aced6e446cdec33d78c4cbdb636b9d3b78f"
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
