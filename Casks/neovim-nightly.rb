cask "neovim-nightly" do
  version "nightly-e750f7c357f335b186ceed1063d5aee1d0a762c0"

  on_arm do
    sha256 "646a6f72f65497e99fb88a68369e32fe422613747fd62f75cd53f4905f1a87b6"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "fd50da49faa2009def13edb5f3eefe6fbe09081b1f89c5b249c0ee65abcd4923"
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
