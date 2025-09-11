cask "neovim-nightly" do
  version "nightly-0f64f0f5b66b19a6d118d88a54a2a2d069b602c6"

  on_arm do
    sha256 "ef7911eaec2c463c458a0586a84bba132588fd8ac12a7e7faaa4016f7f7136a1"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "489cf1bd4aafd0acff43470c8ed656d19caf4100555feb136b5d8cee3457908d"
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
