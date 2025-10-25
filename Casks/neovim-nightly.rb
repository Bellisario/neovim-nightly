cask "neovim-nightly" do
  version "nightly-fe4faaf81a6f3a8a9374bd8429b405cbba3e421d"

  on_arm do
    sha256 "13d0a22d803ecc83724e867733b0e16ee023b5c6dcb22540f1b17774a398026d"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "423a46f84aea57fb4d9757c57be025879ab95bca8a30d7a483706f566fcd0f2e"
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
