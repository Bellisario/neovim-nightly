cask "neovim-nightly" do
  version "nightly-2c6469aca451027648c3317f11ffb6b35b7f835b"

  on_arm do
    sha256 "ec0f5a2b938a8f69bb5d2dc70abbb32b0efbb607a113b301acf492ad3f39823a"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "511bca232abc6b8df8c0597c212b90565f25edc66e527cb0f4b0e51449bf6eec"
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
