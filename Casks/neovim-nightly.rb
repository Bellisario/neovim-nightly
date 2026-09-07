cask "neovim-nightly" do
  version "nightly-36cc62b27633f170d895d66b230eb5dd66b9ca1a"

  on_arm do
    sha256 "f5142914694dffb836f1f5acc70f30e6a79c5fdef792a37981a1f18f070e04d7"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "bbc0c927ad3e9f472e58a577a92442239baab85618ddb1b3fcb633bb99775bb9"
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
