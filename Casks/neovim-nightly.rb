cask "neovim-nightly" do
  version "nightly-898e6f884e1331b92dc9deb5148091b32df017ca"

  on_arm do
    sha256 "a1deefb81500f63c4f282ff77154754dfefffe15f823cc485a086f3f1ab37c97"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "f7b04f031260404a21a917e4675a1b0a9f33d5b819fb26f70ca62f31476ca0ec"
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
