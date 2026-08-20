cask "neovim-nightly" do
  version "nightly-40740f49f839cb81fb5c70eeceedcaca0a0568ab"

  on_arm do
    sha256 "a10fdc10bb78fa92d0fc875a7a57aaf57cc9002d63d0225471e606f83aa5b57a"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "9e21b27d5c7743ef3737201508186f4e6047f772b1436d11fac8c21a012166b0"
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
