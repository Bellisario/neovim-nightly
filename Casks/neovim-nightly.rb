cask "neovim-nightly" do
  version "nightly-cb48904c49f95dab53579ccee5b6445ea6e58023"

  on_arm do
    sha256 "bca1dafea910dd646c91c4e6eeefda8a77a5c3004e435678e59fc6720b600f99"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "e425bd2cefc18e556a34cd34daa184bbeb1a98434aec37299ec33b6c1ce24cfd"
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
