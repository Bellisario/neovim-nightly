cask "neovim-nightly" do
  version "nightly-164dfa1d5f6f0ac342d3cbcaea1264eeb9496747"

  on_arm do
    sha256 "23e6a30dbbe0c12d50d1483b069615d2f1a446202bd10b95a236f2e3d9c89a78"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "0057158af6b67006b82ead4a5ce58698494622d888805b1ba71c941b8d8bc9fa"
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
