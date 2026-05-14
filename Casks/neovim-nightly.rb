cask "neovim-nightly" do
  version "nightly-6780e78b0981f52aec9c4ef96356d3fef3742c9a"

  on_arm do
    sha256 "0f0b137fd0bfd4394ca6e55d797f28421fa17752691f6cfc0bc447e9250c36ec"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "b78d18fe5c3af01e1ddde2fd56a4aaca906d02ebf4a7ca021b4d1924489c24de"
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
