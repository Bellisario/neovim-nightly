cask "neovim-nightly" do
  version "nightly-ec671a2d51d0418d9bb01bf17329fcc1e956004c"

  on_arm do
    sha256 "50ff6470b95b69f38726f7cf30c3426a6329f43edb97c2364654b297b3d66d5f"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "4014a19598dd89e0d71fccb7b20d98f5b5bf347aebb9131626ee0fe82423d947"
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
