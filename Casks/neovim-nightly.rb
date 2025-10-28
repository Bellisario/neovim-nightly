cask "neovim-nightly" do
  version "nightly-7088441de41c468e22dc5daffd377c00211ce45b"

  on_arm do
    sha256 "a19b6119f7e38f44424fe62cc023f504dbc0ce63d36e560dc9bc26358d55471c"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "98950a108c6c55954ea671c9c3982f4953b3e9ea314db93c4b565d54a1104c05"
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
