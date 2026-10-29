cask "neovim-nightly" do
  version "nightly-9290926ccf55ba3f55e4b48f5b94cad403017688"

  on_arm do
    sha256 "4b4b12582b7740d8f4d8068687dec2f9b8ceb8eb69dba59f7c8da84fc63b82eb"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "17305e9100f9e7e9cb12c2172673dfdcea130d5f5c47f5871536f7dde88054a5"
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
