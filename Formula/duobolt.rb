class Duobolt < Formula
  desc "Fast duplicate file finder using BLAKE3 hashing"
  homepage "https://duobolt.app"
  version "0.4.5"
  license "Freeware"

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.duobolt.app/mac/cli/aarch64/duobolt-cli-0.4.5.tar.gz"
      sha256 "e8ac6bd1240f9ad29c7c7eb3dfece1a1eccde08036de6d0d8bbd0de7c7e479a5"
    else
      url "https://downloads.duobolt.app/mac/cli/x86_64/duobolt-cli-0.4.5.tar.gz"
      sha256 "311ccea81d11217b20772c4a0eb0536c024a21ab3fbe50ba1a807620b1a23df8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://downloads.duobolt.app/linux/cli/aarch64/duobolt-cli-0.4.5.tar.gz"
      sha256 "fe9702bad4bce84072201efcd19bfa7923811bc4539fb5a805e871ed998d77bf"
    else
      url "https://downloads.duobolt.app/linux/cli/x86_64/duobolt-cli-0.4.5.tar.gz"
      sha256 "c698c832a34eb032b1f11248d67fb6baf740d3c70f881f3e4646b7e4d9f93c78"
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
