class Duobolt < Formula
  desc "Fast duplicate file finder using BLAKE3 hashing"
  homepage "https://duobolt.app"
  version "0.4.6"
  license "Freeware"

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.duobolt.app/mac/cli/aarch64/duobolt-cli-0.4.6.tar.gz"
      sha256 "7bf547b81087e2e2956e3ed47be78de458fd4ff7675304d5b799a5105cf8bc6c"
    else
      url "https://downloads.duobolt.app/mac/cli/x86_64/duobolt-cli-0.4.6.tar.gz"
      sha256 "2b87b8657ad2def17b2e2251481576c5e8a7d0d3f4d2508c1d972cec8c38b8ae"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://downloads.duobolt.app/linux/cli/aarch64/duobolt-cli-0.4.6.tar.gz"
      sha256 "268dde4932bc5fc4dee7ad8352963d2d4f721086d2ed1f5711f311fdb67e91f7"
    else
      url "https://downloads.duobolt.app/linux/cli/x86_64/duobolt-cli-0.4.6.tar.gz"
      sha256 "dca75459c3cbe5565fac6de6c97f7122ce8b0d8f7bbc6f346efe7cf59e20cacb"
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
