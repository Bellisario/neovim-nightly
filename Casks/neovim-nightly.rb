cask "neovim-nightly" do
  version "nightly-382963891c9b7781a2a6cfa91e8e2f95f4eb586d"

  on_arm do
    sha256 "0f4f16d7e79cf7b8a2bc861eef62a878a15a70629e2ecb39f1afbea6de4b8cba"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "611f330c8690294f75503ba9661a49774888393cec73183cbd3866e246d00f61"
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
