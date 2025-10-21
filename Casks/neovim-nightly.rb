cask "neovim-nightly" do
  version "nightly-73ee507317e705d12efc005c121eeffa15ce0bdf"

  on_arm do
    sha256 "e96c69ab26797a31a92e85ca1bd3e97615f9ce9c712b9802334b47bf1c50eb60"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "2f3c3b782624b955656ee6a74d5aceeb17f0b17228a614c394fc1b55e4798734"
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
