cask "neovim-nightly" do
  version "nightly-17d126049a25c10b8895c27eb2041a06b46ad7da"

  on_arm do
    sha256 "8905f3befb8cbf34fcc3c05f8266b757d04e239698ee96035944bcf3f015cce4"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "7593f9b70fc237e271cdb35a1bfd1046dda7066ac6c5c119579ce4d55ff5ccfc"
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
