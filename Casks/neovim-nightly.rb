cask "neovim-nightly" do
  version "nightly-e3c36f31e3a0863db0458c339eddf6e22cf0c2ec"

  on_arm do
    sha256 "54af5f8f1582821d77845e90e49928b6f53af414012bbb282edf09bb2df48466"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "5599e936fea02030410e873fd0248f44020121b7330dccbcf4eb0432d7e80a97"
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
