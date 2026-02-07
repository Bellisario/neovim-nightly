cask "neovim-nightly" do
  version "nightly-7720e52a0b4aa973540934ab6dcf4703dbde3b9f"

  on_arm do
    sha256 "fb23ba557160b9c1e28934a41d45101bafabc52831c7f4aa5eed3e593d30f7c6"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "704c0ac7614a6f57876f73823bbdd39530fac8e883e24d18dbf26a01ee4e5664"
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
