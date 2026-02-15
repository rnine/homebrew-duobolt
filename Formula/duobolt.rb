class Duobolt < Formula
  desc "Fast duplicate file finder using BLAKE3 hashing"
  homepage "https://duobolt.app"
  version "0.7.2"
  license "Freeware"

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.duobolt.app/mac/cli/aarch64/duobolt-cli-0.7.2.tar.gz"
      sha256 "64ec197ea61dfcd2b566236541e863cc8de3a774d0307bbb1f4d4a0ecacc5371"
    else
      url "https://downloads.duobolt.app/mac/cli/x86_64/duobolt-cli-0.7.2.tar.gz"
      sha256 "db0fd5bcee3be6452cb64bb24e1fdf890be25845875157f83df14a9072c5333e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://downloads.duobolt.app/linux/cli/aarch64/duobolt-cli-0.7.2.tar.gz"
      sha256 "7303449fc01bb470598ca82c27c66dc855913aa720ce093b717389808b234e2a"
    else
      url "https://downloads.duobolt.app/linux/cli/x86_64/duobolt-cli-0.7.2.tar.gz"
      sha256 "b4c72e2f12d5cac962f91b7f4355282737b4d6eb56e271714ed927e27deb3f55"
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
