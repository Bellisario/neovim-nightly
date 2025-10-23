cask "neovim-nightly" do
  version "nightly-af0f7b59b1fcd92e64841cb5da8a577e944ce5bb"

  on_arm do
    sha256 "6cbbfdf1519de821d127f22d5fe6567c85e8972c587931264d5c9d7112df01ea"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "912517d1051320b2563502c7b4c7a44580727b6d1a365107aada3f4376ea4cdf"
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
