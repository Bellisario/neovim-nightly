cask "neovim-nightly" do
  version "nightly-57d97e513d017a5fb09f9d28f674c9bf0c5e879e"

  on_arm do
    sha256 "939935f20bd8042ccbf15d0f4c9e0377a021285008336568326f19f2f6da698c"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "19ed11b05118d9086df2fb47f793c50308b86f3aa2113a3234e359f024a45413"
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
