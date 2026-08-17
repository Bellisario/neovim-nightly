cask "neovim-nightly" do
  version "nightly-8c0bf183745928f71fbd58f4b73afafbd6a045d4"

  on_arm do
    sha256 "7b139382cdfd693976e19c4fc9422a9a89920e98d0b3d8807dc3636cc32f660d"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "817beca26e4b51581c8f7b18b8369c10381beaad282a7115af27d2a65c8b9016"
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
