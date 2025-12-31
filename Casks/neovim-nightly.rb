cask "neovim-nightly" do
  version "nightly-f4f60f6a193f9c715fe5ff7574c8c42d17ad04f5"

  on_arm do
    sha256 "4dd7f3a77619b9bc1193a172d306ed38dcf443f62bf710698ff8efbf6ac65de2"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "0611f1ed634ec506b5601290d82198a2cf59b62df21d29d719c2df4a367d763e"
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
