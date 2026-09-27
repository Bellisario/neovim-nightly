cask "neovim-nightly" do
  version "nightly-521eddec7c243a8166609bf1734cb940e9510fc5"

  on_arm do
    sha256 "80abc3abadc0e3f3b18bbe7f5600cbe6b80c68e4e0f27f30ed7338bd3add0834"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "10b0005088307ab1d800b40aeda5b0dac6e535d7e9498b6da62e62eae53ee285"
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
