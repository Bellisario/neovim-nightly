cask "neovim-nightly" do
  version "nightly-03d6cf7aae4a72c7221a4fb8ebb14a7c8603ba18"

  on_arm do
    sha256 "04336fbd7efb7d4c17a182fcf26d5a202a526c7ae0ce9f07247e8894ac7e6c79"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "b0fe3529b5193a166afae59895646043ab792a0d45a32f0d27a8face706e1400"
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
