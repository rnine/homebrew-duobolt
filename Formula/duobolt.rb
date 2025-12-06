class Duobolt < Formula
  desc "Fast duplicate file finder using BLAKE3 hashing"
  homepage "https://duobolt.app"
  version "0.3.108"
  license "Freeware"

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.duobolt.app/mac/cli/aarch64/duobolt-cli-0.3.108.tar.gz"
      sha256 "5400d9f2992a29c63f242e09b69e19ed6f201a99f4a0ddb10060c79c9934a44b"
    else
      url "https://downloads.duobolt.app/mac/cli/x86_64/duobolt-cli-0.3.108.tar.gz"
      sha256 "011cfdad0e955057bb18ca05abe233a52b3fd23a12da72d758916735c77e25a6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://downloads.duobolt.app/linux/cli/aarch64/duobolt-cli-0.3.108.tar.gz"
      sha256 "6ca26d64c187db92c8a414578d9e23e03a227417e99873360eab325723bad053"
    else
      url "https://downloads.duobolt.app/linux/cli/x86_64/duobolt-cli-0.3.108.tar.gz"
      sha256 "491ee8c8b1233ef72c631355cbaf827aede4638863e5c838826103bae49d7551"
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
