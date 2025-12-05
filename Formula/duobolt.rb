class Duobolt < Formula
  desc "Fast duplicate file finder using BLAKE3 hashing"
  homepage "https://duobolt.app"
  version "0.3.96"
  license "Freeware"

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.duobolt.app/mac/cli/aarch64/duobolt-cli-0.3.96.tar.gz"
      sha256 "d42f4732e21dfa0059ad45a2880bdc27493b79e0c55492030e4f62bcd4ed469e"
    else
      url "https://downloads.duobolt.app/mac/cli/x86_64/duobolt-cli-0.3.96.tar.gz"
      sha256 "ad14a26f05e0200b40ba3857e33583be0f2b3670557576622a97133575a32db8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://downloads.duobolt.app/linux/cli/aarch64/duobolt-cli-0.3.96.tar.gz"
      sha256 "9de50f7523eda252148e20fd415a9480e37cf60049d06d54b2db5d91064f50b6"
    else
      url "https://downloads.duobolt.app/linux/cli/x86_64/duobolt-cli-0.3.96.tar.gz"
      sha256 "b2a3188ab58caa54bbdff85f26cd500f38a10d3461997d4051a349fa89d2654d"
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
