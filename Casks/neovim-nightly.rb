cask "neovim-nightly" do
  version "nightly-e4876d8126e05b28f2e856bdc8801ad2e6914276"

  on_arm do
    sha256 "eb8fa10eefc50be519748fb2d251d4e795b19d63d7950b1600b37a0d8c3192ec"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "5469d3854a36ddf6f625db3385775382ddea08cafdbf2bac3bded51181d867f5"
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
