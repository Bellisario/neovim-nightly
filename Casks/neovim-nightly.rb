cask "neovim-nightly" do
  version "nightly-400f2473972898ecfd89ac3c55222ace0cc248dd"

  on_arm do
    sha256 "dc770a02f80f0e50f2ab740f629ade597ad2e5fe1e0595119af15759aa7a3927"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "490690966bec3ff4b6c53f06fc498b3cd3cf507ba0a1f2d711d090de724fe0a4"
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
