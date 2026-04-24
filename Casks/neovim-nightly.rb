cask "neovim-nightly" do
  version "nightly-c0e358f7e8ac92dbaba771a74d17d1754e3c6320"

  on_arm do
    sha256 "d5dd4b83ba718a872cfc1389d3d86bb2f5526d32d4b535168cd51065eda40a40"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "8753f784133c68df8c8a58da40edb960eb4051c1ddf42f9f41fcd1c176192d1f"
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
