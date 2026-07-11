cask "neovim-nightly" do
  version "nightly-59dbca9b0c2eb12b7cd4432407c5bff6a1b32228"

  on_arm do
    sha256 "9151c305d89502a571bc0c402f39e68e2a9a1fc0afb038992464b06d9b6ae31b"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "a7e2dc911585daaf67127ea012dea2426cbb077d438f5f60ee666099fdc6761f"
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
