cask "neovim-nightly" do
  version "nightly-c2a196f19be1a7a625e47eaf15a295a0ac6e356d"

  on_arm do
    sha256 "0c3d67dc4310a24d048eea2bc5f237ea34245cde6f9a35d8c356bc22dd8d50b4"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "feb612394520983643bc197ad95e79121fc07cf2f8406caf0943e1d8ea2f3ca9"
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
