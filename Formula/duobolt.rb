class Duobolt < Formula
  desc "Fast duplicate file finder using BLAKE3 hashing"
  homepage "https://duobolt.app"
  version "0.3.121"
  license "Freeware"

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.duobolt.app/mac/cli/aarch64/duobolt-cli-0.3.121.tar.gz"
      sha256 "8fd4392322502b5f9a9c47159fb75fc7749cff95f237434c62ac539f81487d47"
    else
      url "https://downloads.duobolt.app/mac/cli/x86_64/duobolt-cli-0.3.121.tar.gz"
      sha256 "28875f5f5a3277d498809f3e58d29967f37053cc6cf53df7fad3627670383494"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://downloads.duobolt.app/linux/cli/aarch64/duobolt-cli-0.3.121.tar.gz"
      sha256 "d2b2177246a8f136e517b9c4b5a1f04efdd70b83cb89d332fd1553cf5f1efea1"
    else
      url "https://downloads.duobolt.app/linux/cli/x86_64/duobolt-cli-0.3.121.tar.gz"
      sha256 "2898ba2cab830f901577d5ecffc5a2d2e6757bcb3e77a89117ec1f1b2ff21dee"
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
