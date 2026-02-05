class Duobolt < Formula
  desc "Fast duplicate file finder using BLAKE3 hashing"
  homepage "https://duobolt.app"
  version "0.6.1"
  license "Freeware"

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.duobolt.app/mac/cli/aarch64/duobolt-cli-0.6.1.tar.gz"
      sha256 "840c4791b945ccafc878ae39969d856dc599310ff01c3df863e264a0ab6b59ab"
    else
      url "https://downloads.duobolt.app/mac/cli/x86_64/duobolt-cli-0.6.1.tar.gz"
      sha256 "73ef36a6669d7a20c5c9c747a4f6f4a9798e861882b91d22c10e2ad33c4de8f6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://downloads.duobolt.app/linux/cli/aarch64/duobolt-cli-0.6.1.tar.gz"
      sha256 "42e60ff269e964b738d79722d27daf0475b2beac7edc814b69fa22304608bfe8"
    else
      url "https://downloads.duobolt.app/linux/cli/x86_64/duobolt-cli-0.6.1.tar.gz"
      sha256 "eeccd81c5b2a63854ff9d36ce46ecfb630460718c74a7cd67aa0f9ef00f0eb29"
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
