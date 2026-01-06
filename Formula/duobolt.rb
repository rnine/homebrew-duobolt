class Duobolt < Formula
  desc "Fast duplicate file finder using BLAKE3 hashing"
  homepage "https://duobolt.app"
  version "0.3.116"
  license "Freeware"

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.duobolt.app/mac/cli/aarch64/duobolt-cli-0.3.116.tar.gz"
      sha256 "8f87eb81637e692b84a4e11e727619fd48d926c3e59b0b2ec6cc08f16c541cf2"
    else
      url "https://downloads.duobolt.app/mac/cli/x86_64/duobolt-cli-0.3.116.tar.gz"
      sha256 "a4e8ad1750d82bc6723034cc30a3abaa9584a5508965cc5ecd98127f0e4804e6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://downloads.duobolt.app/linux/cli/aarch64/duobolt-cli-0.3.116.tar.gz"
      sha256 "f96563138cabdf952d25d7f2f674675c87e7df54e703058bad58f3b8cbce1649"
    else
      url "https://downloads.duobolt.app/linux/cli/x86_64/duobolt-cli-0.3.116.tar.gz"
      sha256 "93df8875c85b49f9ec91da08a642b816d8a1ed4d91c0add4a99e1ce8a9283d85"
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
