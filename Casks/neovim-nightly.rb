cask "neovim-nightly" do
  version "nightly-eb9be11da854b4901f9d8f5b2f2b6c45427df5de"

  on_arm do
    sha256 "b9168d5f038293e34ea2c7a82e9d9531642464c1ba80079742f6408fc177b16e"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "6b0acab20d3f936a40588af0975f221ffbb7753bf6df6d3dcdf7bf16891355bc"
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
