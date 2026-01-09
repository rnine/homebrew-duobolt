class Duobolt < Formula
  desc "Fast duplicate file finder using BLAKE3 hashing"
  homepage "https://duobolt.app"
  version "0.3.131"
  license "Freeware"

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.duobolt.app/mac/cli/aarch64/duobolt-cli-0.3.131.tar.gz"
      sha256 "8e41be06759a99f927b7c7de0748feef4f7e16edd3e6de62f23516e6a1a69919"
    else
      url "https://downloads.duobolt.app/mac/cli/x86_64/duobolt-cli-0.3.131.tar.gz"
      sha256 "2f50b09d58d890ff8f030faa85ece08962bd397b7d56fccad95191c9c38781d9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://downloads.duobolt.app/linux/cli/aarch64/duobolt-cli-0.3.131.tar.gz"
      sha256 "28cd7756f3fe10547046ff0b9fab34da8cdbd468b951b8d0b4b9988f7de6597e"
    else
      url "https://downloads.duobolt.app/linux/cli/x86_64/duobolt-cli-0.3.131.tar.gz"
      sha256 "3224c57cfe1ea5147976b686950c1256dfc8644c7cb6960db655e621192df8e6"
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
