class Duobolt < Formula
  desc "Fast duplicate file finder using BLAKE3 hashing"
  homepage "https://duobolt.app"
  version "0.3.81"
  license "Freeware"

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.duobolt.app/mac/cli/aarch64/duobolt-cli-0.3.81.tar.gz"
      sha256 "Not"
    else
      url "https://downloads.duobolt.app/mac/cli/x86_64/duobolt-cli-0.3.81.tar.gz"
      sha256 "Not"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://downloads.duobolt.app/linux/cli/aarch64/duobolt-cli-0.3.81.tar.gz"
      sha256 "Not"
    else
      url "https://downloads.duobolt.app/linux/cli/x86_64/duobolt-cli-0.3.81.tar.gz"
      sha256 "Not"
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
      Documentation: https://duobolt.app/docs/

      Usage:
        duobolt-cli scan /path/to/folder
        duobolt-cli --help
    EOS
  end
end
