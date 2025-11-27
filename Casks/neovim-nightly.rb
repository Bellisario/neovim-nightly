cask "neovim-nightly" do
  version "nightly-e4ce0c7270e52ecaf586a0ddcee262e2f1adaabc"

  on_arm do
    sha256 "2d2bcd8e1bed8a890362a7c76347455348521fc9d43be4de740c7be18159f0ae"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "faf6efcaeb8fe1d6ac571450adfca2130ecf8116f1062a520ef9869fc534a43f"
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
