cask "neovim-nightly" do
  version "nightly-19f64a2680d32cc0ff5316e1e2961ecb33a1640c"

  on_arm do
    sha256 "4f1014dfaed26ce7828d2946054c6aeb5b7e8d60bc7e77b20a1f3416e2d1626e"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "70882053aeecc164bba23ad52fc92f505979826a8a92386e94bd9b46dc2ec5d1"
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
