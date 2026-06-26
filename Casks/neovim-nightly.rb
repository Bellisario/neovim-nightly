cask "neovim-nightly" do
  version "nightly-b9b1992d9dc54db7eab6f3740580774772511bfb"

  on_arm do
    sha256 "847d8b9d68bfdb8496c4506b47cc146fd9210a09e843842591955c07e1b0eea2"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "49230f884f8eace9b751e22d4287d86f58ebb7c1b0fe9b779f62de72773599a5"
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
