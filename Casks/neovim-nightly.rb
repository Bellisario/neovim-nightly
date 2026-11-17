cask "neovim-nightly" do
  version "nightly-4ef4bed584a099d03ec7591306c33e1f81e68ae8"

  on_arm do
    sha256 "053b52e701d1002c173392d829a2aa9bda6b0c65da22500cd44defec3f84cf63"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "9b45eec11bb6a80792c056c926f8cef6bf77b63bb3bfd692fb2c8ea217bcbe2c"
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
