cask "neovim-nightly" do
  version "nightly-41068c77aa1b221bc4f4321ac0dfe55e13a9f27f"

  on_arm do
    sha256 "1547bfe9d362390a689a86d1f4960157e6c6a64e709666c5bdd35eff56fb5b03"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "9b509c95cabbf5ac8306f0e606924c34189363c8b7c4a500ffdd370280d52446"
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
