cask "neovim-nightly" do
  version "nightly-f8a56a8439857da0c4c231d5f5058eebac3f360f"

  on_arm do
    sha256 "07ca7644ea89fe71ccdb1401ea92768b0630f901b1ed676a14bfaa054a6e3350"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "afa98c3934e85807c5e101867d19cd90c430f89aea5ae65f44017315c0ab28e7"
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
