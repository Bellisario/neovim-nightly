cask "neovim-nightly" do
  version "nightly-61e71ccf8aa17a2fb6fe5caa115daf21a0b3e9fa"

  on_arm do
    sha256 "89dad956be6bbb86c8d41f33721e9ec60e1cbf46187a7b8a9335d7b61f47cf52"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "80a98e3a467e14f92e9d0e96089c5e53824fe88d136186b158c8bbff1d4cec47"
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
