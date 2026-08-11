cask "neovim-nightly" do
  version "nightly-2757f6eef92a99812d5ad12408d03592bd54f10c"

  on_arm do
    sha256 "3ed707a92fca8ba5ac6f644aa2248f74caa789e1846bf7315fd145075654ff61"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "e01c0941dcc25880974e3b1034564c1ae6e64e2142ea6347f7c2fe4bcaed735f"
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
