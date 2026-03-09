class Duobolt < Formula
  desc "Fast duplicate file finder using BLAKE3 hashing"
  homepage "https://duobolt.app"
  version "0.7.3"
  license "Freeware"

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.duobolt.app/mac/cli/aarch64/duobolt-cli-0.7.3.tar.gz"
      sha256 "0c6079d008258ddd52b2ab2fda29a966978c794e86d8a7c12e0ce0657d4d04b4"
    else
      url "https://downloads.duobolt.app/mac/cli/x86_64/duobolt-cli-0.7.3.tar.gz"
      sha256 "11e1e06d5a012b45f9aa0fda88fc0c4f3dc3a6556c94b282d9fdcf8da411476a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://downloads.duobolt.app/linux/cli/aarch64/duobolt-cli-0.7.3.tar.gz"
      sha256 "be3a7b24e581981d607c7653a1d40137882cd995fb491dbad58cc01ce8026810"
    else
      url "https://downloads.duobolt.app/linux/cli/x86_64/duobolt-cli-0.7.3.tar.gz"
      sha256 "aed626ce2ed1330927f698fb2e529f64f5a138617634d0f3b416dc6e7a70feb8"
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
