cask "neovim-nightly" do
  version "nightly-2c2203c04005495b4a6272eb178a90ce06580e9d"

  on_arm do
    sha256 "69995b4022155a7b1fe28923efebb285f5e7d615951bfe495209ffcc6f0d1b88"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "eb8dcb2fbff7895621c3ca868b06150b3f711a245d25d252502aac1fb622c4de"
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
