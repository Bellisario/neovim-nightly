cask "neovim-nightly" do
  version "nightly-c08139d790b783dc82f96869fdc14111495d1cd4"

  on_arm do
    sha256 "42cf76b9bcf2cdfa803cadec30a44b155e9b15066d16d88f3a9be6b82de3bcb8"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "c83d46b4a54fa35e9650c20dc518c5842eef487d70f496ec61e6dcb072c25695"
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
