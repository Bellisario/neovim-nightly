cask "neovim-nightly" do
  version "nightly-f8d59cfab9585a538760e404789029be743b61dc"

  on_arm do
    sha256 "e67c2e8c03a1b6d18e619789020c91f5701174fc981ee7c39ca361ccab15f6d9"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "712c129837b901b60a33decb58099a5aad3a9aafc0c4edd269c6ba7ce04ff4ea"
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
