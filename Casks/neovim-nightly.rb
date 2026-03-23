cask "neovim-nightly" do
  version "nightly-0a60f32af3c02d538ceae4a6e40e5e0b1faa75cb"

  on_arm do
    sha256 "870e605531df242ab935f91dc822c3065cbd818a3bcdea23559f84ce158279bb"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "1fdfaccb5872b0d0c6fd6a5b29d47f5af49235b9ca40a97ab9d238859d089b79"
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
