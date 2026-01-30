cask "neovim-nightly" do
  version "nightly-a60d5f863e060ff35a38e0d5a829dfe5b8aaecac"

  on_arm do
    sha256 "73ef2eb5c84e42114d375691cd21befe17c2415192ab28225f3b9018304b0947"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "9f142932004aa05e1c45add2702ccadf7d16de2ec4cd79867c83b70d6b7c97b8"
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
