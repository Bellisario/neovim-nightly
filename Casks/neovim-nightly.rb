cask "neovim-nightly" do
  version "nightly-b256e0476bdb353437a07b7bc05a1cd176b077d5"

  on_arm do
    sha256 "0f384b6653493e8aeba76b987155defa471ecf1ca63b1265ea6d23d5e210d4f7"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "fe0141b1a42986e32f28f7e13db671b9f9e980b93732b45aac3e295d4aef4ba4"
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
