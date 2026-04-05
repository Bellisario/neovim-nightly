cask "neovim-nightly" do
  version "nightly-39335d6a7d8e097798b2e59bd53d25fa54456021"

  on_arm do
    sha256 "7c8c0cda2a362602db4fc212e3dd0ee0d6ebcd1e414d8d716cfaf0f1fe2b0d57"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "edbb20f2d30a66b18f2b5cfc45747f3a3aaaaaf9a8fa48064db42f561f6bb742"
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
