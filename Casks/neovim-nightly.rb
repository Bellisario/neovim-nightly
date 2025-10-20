cask "neovim-nightly" do
  version "nightly-869e55f2aacdc986a51f0bb683f11dcf0c464e98"

  on_arm do
    sha256 "4ddf7eeaa9030dec0d56403a14d975f9215300b53068d810cf037463f1780a60"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "aed42e9fbf3276a5e460e14d63b56a72eb58894deb4b294dd1cc50682dfef6e9"
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
