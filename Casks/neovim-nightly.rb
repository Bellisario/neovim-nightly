cask "neovim-nightly" do
  version "nightly-0197f13ed4fa71700fb4b5577a1375e4f34e2ad6"

  on_arm do
    sha256 "841eb3bffb5baf02930d20700e478eecce8ba774dbb410a109d397e875da513c"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "6792c6d1f23a36637f07ce4c3bc6ff783f18f9a977cc287bc4242f55130971a7"
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
