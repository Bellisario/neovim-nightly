cask "neovim-nightly" do
  version "nightly-b12ba37bcd772adc5b99cad286757c83d6e88757"

  on_arm do
    sha256 "4d1ec1af75730ec21918ad1e1e3c4f5769f479cc150d077f2640e462d89e6183"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "503f819fe1bed21cec8c15342f2176994ee4f9f2467cf69a42f14f454f7daa72"
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
