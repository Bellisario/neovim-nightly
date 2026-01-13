cask "neovim-nightly" do
  version "nightly-9afd81512b0ccded5499635d28dd50d065298ff0"

  on_arm do
    sha256 "36d6fb9cf1df5cfefca483374c51cafc214fd027e07dac7a19c301b4b0e5f8c0"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "d1fa14b6ec6c0aaf1bda922dc741d68e48dc8dc89a88d515beacb581f8dd2cdf"
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
