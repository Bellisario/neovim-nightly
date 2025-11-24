cask "neovim-nightly" do
  version "nightly-dbd7f4587371901f927152037c8f38fb63b1f59d"

  on_arm do
    sha256 "a0d9ce1148d2b2bc5e6066afc06d1342fc519bfae7f36535c65005ed9bb705ee"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "d7eefd05ffc7aae3368fd5f2e6848c72250e1ac754a1ceac1060b780318215ac"
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
