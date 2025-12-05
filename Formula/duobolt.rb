class Duobolt < Formula
  desc "Fast duplicate file finder using BLAKE3 hashing"
  homepage "https://duobolt.app"
  version "0.3.93"
  license "Freeware"

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.duobolt.app/mac/cli/aarch64/duobolt-cli-0.3.93.tar.gz"
      sha256 "8fe5a666216030d310166a5dce8361472a4283883be334506a3faaf170c79a54"
    else
      url "https://downloads.duobolt.app/mac/cli/x86_64/duobolt-cli-0.3.93.tar.gz"
      sha256 "f8d6f79b551a5a31d82498581b4004d4f0407a4a3cc7449c739e37e6d8478e94"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://downloads.duobolt.app/linux/cli/aarch64/duobolt-cli-0.3.93.tar.gz"
      sha256 "528759edfb01151196635d8a44d655cd422520edae2f76ecb8870bc0f750a0fd"
    else
      url "https://downloads.duobolt.app/linux/cli/x86_64/duobolt-cli-0.3.93.tar.gz"
      sha256 "ecf130835324e3b6c628a119154bca37589a860aa65875e55294617bd97e3b72"
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
