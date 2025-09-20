cask "neovim-nightly" do
  version "nightly-19ba5899460ffdbf159ad4323ae5f3af6ce2eb53"

  on_arm do
    sha256 "2428c65ac1f9f6eea179e6705f88d8e1eb33b5a97a0239e961fc84ea5cf5222f"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "94770797a3cdac336ec82ea01b8342916cae622923dfe0087c9d2f297d19cdc0"
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
