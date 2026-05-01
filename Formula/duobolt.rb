class Duobolt < Formula
  desc "Fast duplicate file finder using BLAKE3 hashing"
  homepage "https://duobolt.app"
  version "0.8.0"
  license "Freeware"

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.duobolt.app/mac/cli/aarch64/duobolt-cli-0.8.0.tar.gz"
      sha256 "eb6041c3756798199fe3df314792d5d0795bf9b8ee6acb43b39a9c40a75d3444"
    else
      url "https://downloads.duobolt.app/mac/cli/x86_64/duobolt-cli-0.8.0.tar.gz"
      sha256 "39f9672f2b003c0040ad052b013ac3af0b255577c0414e975f449922cabe4088"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://downloads.duobolt.app/linux/cli/aarch64/duobolt-cli-0.8.0.tar.gz"
      sha256 "8bfc8a5c72ac6d5382844baec3f99801487fcd9951648d1e7d2aaa1f53fcfcb9"
    else
      url "https://downloads.duobolt.app/linux/cli/x86_64/duobolt-cli-0.8.0.tar.gz"
      sha256 "c08e89e3d3a0aaf80d85c19dd32e490549a274f57e4ffbdf8cfac378d51b9c04"
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
