class Duobolt < Formula
  desc "Fast duplicate file finder using BLAKE3 hashing"
  homepage "https://duobolt.app"
  version "0.3.134"
  license "Freeware"

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.duobolt.app/mac/cli/aarch64/duobolt-cli-0.3.134.tar.gz"
      sha256 "7d02f50344cf79d1f4d874ea2507e0a71ae47dfdedaa1875cda180bfebf45e4b"
    else
      url "https://downloads.duobolt.app/mac/cli/x86_64/duobolt-cli-0.3.134.tar.gz"
      sha256 "627802c9e70f6bdd9f4de7369ecafb9ef4377afa3d618e282b6814ab607f0eb0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://downloads.duobolt.app/linux/cli/aarch64/duobolt-cli-0.3.134.tar.gz"
      sha256 "b310f8295ccaa16c33020904ce2c1c0cb210acdfca9fdfdd10b075e09b09465e"
    else
      url "https://downloads.duobolt.app/linux/cli/x86_64/duobolt-cli-0.3.134.tar.gz"
      sha256 "1dfc2684672f0306a0fa2ea343412ec8c6b6fedf3bbe8cde404caf0ecc17fe43"
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
