cask "neovim-nightly" do
  version "nightly-2fbc82820b5168b0da4e918c192c05832dfd6211"

  on_arm do
    sha256 "2844dc4a25ef1eae08c22830e24e4ff80c3f9fa92127f57f3223fbd7f9b3cb6f"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "326afa50bddef25970a2b68999c5a6d767984e62098378bb3e9810f7c54da841"
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
