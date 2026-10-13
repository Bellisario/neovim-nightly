cask "neovim-nightly" do
  version "nightly-a054b698c0b7c83e934a38df5c0021ae2cb444cc"

  on_arm do
    sha256 "394eafc018d5fe5046b081a9261d25bba2cbac5d78b8614f3c2e63a430bb0974"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "ae8990920d126e7ad84655cde036849b0fb9196218fd13c2911e6b0f2a18b95a"
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
