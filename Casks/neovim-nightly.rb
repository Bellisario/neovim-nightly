cask "neovim-nightly" do
  version "nightly-ad4bc2d90c5109c24bf6f0119ad31276f1518c6f"

  on_arm do
    sha256 "55403d838b39ebae784be6d25f5d1b6989f47af3cb5f690c80164c93ec9affeb"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "8431c2ff1fc510f4640aab2fb782b60ade968ef5c8e697f1e80bdfd4bd98e0e8"
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
