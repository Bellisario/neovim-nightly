cask "neovim-nightly" do
  version "nightly-a69f2db773b85e03c631a5eb3a37f43098288194"

  on_arm do
    sha256 "6fd51acd2cd3d81ff2f4aedb3627c0a72dc36ad712b8cdcd702de569e6e36ec3"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "7357fd04b9ca73c3a708b3f7de22d969f44676732c55a37b689a0d0b694da00c"
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
