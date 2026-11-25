cask "neovim-nightly" do
  version "nightly-f8eaa151f6a33d3c8d35b4ccc315f57d76149845"

  on_arm do
    sha256 "a68d42478a7469159d33579277baba1d0da0b328e1fd0759222c9318bc601d19"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "4e3a95b8f310cb781733b8dc154ecca1e03bbbe5a68bb3335cfafd557c18ea1c"
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
