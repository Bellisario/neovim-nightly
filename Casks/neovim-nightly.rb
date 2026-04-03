cask "neovim-nightly" do
  version "nightly-3cb79189f3f3a559d92ae4372c4ea7d5e6b4aeb0"

  on_arm do
    sha256 "97ef2725282e3bd93739697addba41b77a74c8c09b85b01acd72edbb23b0c420"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "3b03f00afc57f3de4e5873919cf08f2e087d0fbf70dd543dd5dfd45d617c14eb"
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
