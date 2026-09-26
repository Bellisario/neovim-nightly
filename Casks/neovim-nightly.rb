cask "neovim-nightly" do
  version "nightly-521eddec7c243a8166609bf1734cb940e9510fc5"

  on_arm do
    sha256 "642bdce3c533f6117f94fbf4877fd3b17f05c771e157dff152114e8cb4995563"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "f43e93b0e4f71a06979dc3b7d441afb47843dbbf4aa5d44cac436ae8f0c78f28"
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
