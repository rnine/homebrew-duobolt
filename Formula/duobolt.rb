class Duobolt < Formula
  desc "Fast duplicate file finder using BLAKE3 hashing"
  homepage "https://duobolt.app"
  version "0.3.132"
  license "Freeware"

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.duobolt.app/mac/cli/aarch64/duobolt-cli-0.3.132.tar.gz"
      sha256 "2a59581c55aacb364e11d0438f4cac45dc6a7b49cc19dac04f9940352b6be6e4"
    else
      url "https://downloads.duobolt.app/mac/cli/x86_64/duobolt-cli-0.3.132.tar.gz"
      sha256 "cdea9de4a11bedad454b931a185a259588335cdc895333b481ede814380bff48"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://downloads.duobolt.app/linux/cli/aarch64/duobolt-cli-0.3.132.tar.gz"
      sha256 "8732cddfda69414bb37752790257b1f5b5cd86ec0f2ecdd7e1fdc71ea7a51245"
    else
      url "https://downloads.duobolt.app/linux/cli/x86_64/duobolt-cli-0.3.132.tar.gz"
      sha256 "d19b0a8907de22e109595e7ece225440b7425bd80169fda65ba6d9c7cbf8f146"
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
