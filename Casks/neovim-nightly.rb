cask "neovim-nightly" do
  version "nightly-238d4fa71ad92edb66be2806c161e6304fc7b839"

  on_arm do
    sha256 "d8c195f2369ce56ea88c9992650c574c2b83cdf81bf18d5dd4540d06b0e3b51d"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "9ba724b3b88c03c5dc5c2ab9c53427341885dee56ecb040c4bfbd023fd556ecb"
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
