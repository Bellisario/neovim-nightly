cask "neovim-nightly" do
  version "nightly-3e83f7bec7789fe584cd939e4a60f270a4c626ff"

  on_arm do
    sha256 "f9f839b358f5fe7ea5588658ce547d828c04589a30de31f297e5423a061bb26b"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "182dd046b0eef40ae05afddee4ef589f6745552bc5eafce5687cbf7b3f78cdde"
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
