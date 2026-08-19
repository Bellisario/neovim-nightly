cask "neovim-nightly" do
  version "nightly-53211ade2baba5841050daa50b1c38fedaffdda0"

  on_arm do
    sha256 "4e5195617e5a8a19930ef63bcbd3eb613f2c6d9f6b4bcb15d03e21a59c2e10f9"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "51a9b9d9973c1d9733dd5a83dcdd78c8995066f206f763490114be01d4112c3a"
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
