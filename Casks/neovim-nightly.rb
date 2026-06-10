cask "neovim-nightly" do
  version "nightly-cc056d78fb2dc294bfc3daeba9db1fa3c4f6bff6"

  on_arm do
    sha256 "626ec2dc71cac9b3e861e03cc89105871082d6263c28b7adc8e15e8fcf87bf11"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "09f26a47203f311f438da1aae5a16ed5baa0b4d9f038657b5844df12fd54395f"
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
