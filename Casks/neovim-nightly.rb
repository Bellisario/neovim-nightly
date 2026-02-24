cask "neovim-nightly" do
  version "nightly-d9d8c660fd5559d928c8870a21970a375674e310"

  on_arm do
    sha256 "f516167aca903e9d90e3b6bd1cb7da31246b8758e1fb2c12fd6c572907b47092"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "614c27d2ae0e3fc888e76589f4253220cd2fa9e071b24060020f3c4bf59bd2c1"
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
