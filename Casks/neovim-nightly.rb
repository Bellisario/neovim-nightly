cask "neovim-nightly" do
  version "nightly-0566767d7dbe5b2abce8d37aab85d328629b2cc7"

  on_arm do
    sha256 "e7f9aad2593d3915fc8d0922934f0961e499707814ac30308169bf94ffe66f6a"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "c141de03e6315971053ee81a9ba8f5813d54cf875ee758a28afb5cd35f4f6831"
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
