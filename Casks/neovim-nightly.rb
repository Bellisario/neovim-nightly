cask "neovim-nightly" do
  version "nightly-6d875a03bb5c4f06764ac76e642a8a0b536b0540"

  on_arm do
    sha256 "3a04418c1b1226c8bcabb049a2e960ca5710a884385a80285ff0de9513ced4f2"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "9c4448ccbd1be7d77bb2706ffb0c468d02d6bb4af97d9f34f5cfd5c95e33dac2"
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
