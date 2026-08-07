cask "neovim-nightly" do
  version "nightly-5117b04745b7d9ad7827dd89396d63c13742ee62"

  on_arm do
    sha256 "32249eaa157f5f4d19a50ff7a7aa30dc44261d55da3288f04b7d2bcda5100781"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "9dc0457da16ec2f595926aa07faf2d32085d81470b40936dd121b6ec2e3bcca3"
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
