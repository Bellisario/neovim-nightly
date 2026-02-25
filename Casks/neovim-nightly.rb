cask "neovim-nightly" do
  version "nightly-6d73bf48861c13d190f3085eb54380fa76cb1a11"

  on_arm do
    sha256 "e37d249d9b364e894d0cef3f8be7ee64f5f64b71fb9bab80d44059f16e52c085"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "a900813e9e92f2f6886d9ade27a0ddceb40f9fb5bbb81ed4a0b59548b7ab475b"
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
