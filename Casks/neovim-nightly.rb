cask "neovim-nightly" do
  version "nightly-1dc9728dbd4cb07f07dbfae92e857452f23a2849"

  on_arm do
    sha256 "dc9dd28221db76fb896757e4ddebe04ad7f5cc369ba74dad16b28975be495859"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "b00bcd5797fa0e569274d71d59d5fbb00ad7a6db1fb625cbb44a6655fd870552"
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
