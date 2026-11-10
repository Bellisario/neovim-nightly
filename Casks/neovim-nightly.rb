cask "neovim-nightly" do
  version "nightly-0c4b90023dac24f42ef24278b22fa357b39d38c6"

  on_arm do
    sha256 "ff1fc027385c699654a0e1af2e0a473854390bdc2eb37ed0fabd96d24ada70b2"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "a664e9d94792c54556d66d8956cd9a0cdded3e167b751c652ffcae36c3aa95b3"
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
