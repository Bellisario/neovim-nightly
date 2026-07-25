cask "neovim-nightly" do
  version "nightly-20a3bb33256e35cac213a8f22098de527f21d2ed"

  on_arm do
    sha256 "fb31a845998a7725c98cfa91b069173102a8b34fb1806d396a74806d0adfa901"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "bdce369c3a6750ce0e4668c47ac9c1f73f4282a42344ddab64f93630c1f8c1ac"
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
