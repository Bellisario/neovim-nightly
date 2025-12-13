cask "neovim-nightly" do
  version "nightly-05de0377951c4f2e21bb8f5fef39cbb78035959f"

  on_arm do
    sha256 "fca1c0d4ba7cb6a714ebb39913889242e5297a137c17f864d579ac0ed9a05f4b"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "b4a3d575a78346d296c770d1a720477eb4a139d13644b65e95d8cc94ca70cd00"
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
