cask "neovim-nightly" do
  version "nightly-7e1ae5115f1f7088abe329892948708fc809d45e"

  on_arm do
    sha256 "9d5f3fc10e411fac811f1716a8f11ccf21d7d0cdb657a14ebf78d48e9c61c3ae"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "6393907adcebe41309e6dbf71f8cc157098712d160338e729e46ca337a4c533a"
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
