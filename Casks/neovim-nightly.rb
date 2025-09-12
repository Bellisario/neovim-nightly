cask "neovim-nightly" do
  version "nightly-cf9b7a37cc3cf0ba934865626e1f392e956a59b1"

  on_arm do
    sha256 "799721b8ef7709b9b36d8881dd9caf06b9dc45b3f235d424f98469f5edaacc4c"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "d47ff4d9e2e9a00feafda889b90c3b939e7a3202fc29bc82e4719e77fef8e054"
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
