class Duobolt < Formula
  desc "Fast duplicate file finder using BLAKE3 hashing"
  homepage "https://duobolt.app"
  version "0.3.89"
  license "Freeware"

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.duobolt.app/mac/cli/aarch64/duobolt-cli-0.3.89.tar.gz"
      sha256 "139c8ea7e0c95c6531c5b3e6a96e8cebf63cb748a2bd0bdd04dcf61591f0cc58"
    else
      url "https://downloads.duobolt.app/mac/cli/x86_64/duobolt-cli-0.3.89.tar.gz"
      sha256 "7000c85132e010e7055ba194a3786f346a3143f7cbb286d4638b56ef11797654"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://downloads.duobolt.app/linux/cli/aarch64/duobolt-cli-0.3.89.tar.gz"
      sha256 "c70ca9d07ec0cb41e55e5df23cc150b908adebebcc7e424fa82ed2d0b508fbf8"
    else
      url "https://downloads.duobolt.app/linux/cli/x86_64/duobolt-cli-0.3.89.tar.gz"
      sha256 "6e4f823fbd7bbaf3c69eb2baed6e5bc5e954b09a3195101b0c8184e03b820ff9"
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
