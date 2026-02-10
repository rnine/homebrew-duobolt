class Duobolt < Formula
  desc "Fast duplicate file finder using BLAKE3 hashing"
  homepage "https://duobolt.app"
  version "0.7.1"
  license "Freeware"

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.duobolt.app/mac/cli/aarch64/duobolt-cli-0.7.1.tar.gz"
      sha256 "12de97e122c8c541ce7ff5e8f5f282ebc5754bf057cf6a644e7b8cf0b0fbf7c7"
    else
      url "https://downloads.duobolt.app/mac/cli/x86_64/duobolt-cli-0.7.1.tar.gz"
      sha256 "af66ced2d9df5c67478892118f61e83078ed6d848c9e86cec43fabeaeacb21d6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://downloads.duobolt.app/linux/cli/aarch64/duobolt-cli-0.7.1.tar.gz"
      sha256 "a990bf58e013f51cb531af3109f1f77bc02c50873aaff20df4cd0f6b7cfc9a95"
    else
      url "https://downloads.duobolt.app/linux/cli/x86_64/duobolt-cli-0.7.1.tar.gz"
      sha256 "bf6ad537006c5f191d1e7b1262dc5ad3a7963629e3affe8b684dc1db9ed5fc3e"
    end
  end

  def install
    bin.install "duobolt-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/duobolt-cli --version")
    system "#{bin}/duobolt-cli", "--help"
  end

  def caveats
    <<~EOS
      CLI usage:
        duobolt-cli <directory...> [options]
        duobolt-cli ~/Documents --ignore-system-files --output=json
        duobolt-cli --help

      Docs: https://duobolt.app/cli-usage/
    EOS
  end
end
