cask "neovim-nightly" do
  version "nightly-b756a6165a06a1bca018a30dfa6b6394dc5f1208"

  on_arm do
    sha256 "a756dcdbdb113a073bcb62705d46424e6179790837955a38e01e6f7c2fe5b59e"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "95d83355a874619d8a9afadb324f1e7877537c5f62bd574e5e17c9b444c06a4d"
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
