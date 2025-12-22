cask "neovim-nightly" do
  version "nightly-b95848a8f11d5e8096555efcf69d2c5b4536c997"

  on_arm do
    sha256 "b6c004375ee1990d4ff9e4a6a19bd605ba0ede0246a1e0c5a929387bb988c531"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "35c29d608ffc8aea5f8f9fbf95329d80acfccf3a6c78ea4080f78f0ab057ad2c"
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
