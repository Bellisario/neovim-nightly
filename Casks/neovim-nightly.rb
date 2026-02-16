cask "neovim-nightly" do
  version "nightly-1eb2ca9fcfbc5df443062c5a302f1da6b1a93377"

  on_arm do
    sha256 "f86d884136be5a311463c5b4e7d29ca277e0abbc0a5e47f7a2ab0c4c583b62b1"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "a1cfbbcb269b71ad8e6eaf960c7da1ea84cb8f48c0134434fe3e87f18b358382"
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
