cask "neovim-nightly" do
  version "nightly-c5641b2bfb01024572caae110fc22956d6e7555b"

  on_arm do
    sha256 "12b0e295544ff0b4cf89e786cd350817328d3e038a059a48c50fead400a33fb2"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "0f83f957d01bb09bb9c8eb02df3d24b52b4b770dd7f17e70ff0fbd46e5220792"
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
