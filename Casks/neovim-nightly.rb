cask "neovim-nightly" do
  version "nightly-cb766905464dd4407465a6b880f52e156e7a01c0"

  on_arm do
    sha256 "7fb0e2933321acf273033010d67d67916c9e41f9c0ac8b0c8eb2d2e78e8160e0"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "3b2004962fbe6eea0733c41ab21e3582eb474522213e4842b25598ede4cc5260"
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
