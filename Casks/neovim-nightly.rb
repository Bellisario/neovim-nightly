cask "neovim-nightly" do
  version "nightly-ac1a06021de60ae2b94ac23aa51729c867f57ce0"

  on_arm do
    sha256 "5732b7860e9bcf8f6a2c04a3a7a8d7c9d1cad645f1d8621902b5ec14cbdb4a05"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "1049b2e8f49fe45ffef2e8bc3751c8c7a34c5d3207bdabc7cc32d10937c120d8"
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
