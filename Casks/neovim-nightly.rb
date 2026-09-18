cask "neovim-nightly" do
  version "nightly-4b5dcbccd752a95f4b7268e031f90c18924513b4"

  on_arm do
    sha256 "46079bd7f1a82f407080324be2e9855d8ef20b8df7023efcf314442ee36de57f"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "fd2b4b94ce0b694b2fa4fb7f3fb753a46bed80493133f49b3d9de4c7d747f970"
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
