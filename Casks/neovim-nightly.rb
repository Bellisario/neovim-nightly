cask "neovim-nightly" do
  version "nightly-a35c60471801cdecbf19a7e3261b153fc81a2898"

  on_arm do
    sha256 "f091d3ff8627b6582c27fbb4ebfa0e7a6dea9c2485fcc2de989b856a0a3e3d6e"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "0abbabbfa16473a3e59326653f34ad47cf382e00d1bc4b9f1a9e9fe57d61cfa1"
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
