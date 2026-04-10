cask "neovim-nightly" do
  version "nightly-6d43869aa0ca8b8795aa91bcc5415dd4f2e2722d"

  on_arm do
    sha256 "a52f8232de041654a3538ada77f9b4e96d88dc7228847f4866e7eeb820c15c5d"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "cd9a007863a5752e95639387baca7f15fea7382a4d91e69a421ab3cc25d4827f"
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
