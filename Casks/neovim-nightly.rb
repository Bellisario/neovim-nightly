cask "neovim-nightly" do
  version "nightly-2e8c60cb387b767e0aed298f05b4ade26a8c2b3b"

  on_arm do
    sha256 "99c2ca89d2469ab524b09d21f002e361d65031b18804ba77ed170a00fffbbb95"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "8f9190fd44ae77dd8460e4e5bc1005bb38395d2815751e9eeef9a9f04cf941d4"
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
