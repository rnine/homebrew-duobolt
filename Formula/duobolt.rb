class Duobolt < Formula
  desc "Fast duplicate file finder using BLAKE3 hashing"
  homepage "https://duobolt.app"
  version "0.7.4"
  license "Freeware"

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.duobolt.app/mac/cli/aarch64/duobolt-cli-0.7.4.tar.gz"
      sha256 "a09eeac4ba7db4cb2e792e19d958dd1e8eaa597400bffa0b9a76eb71720a18c6"
    else
      url "https://downloads.duobolt.app/mac/cli/x86_64/duobolt-cli-0.7.4.tar.gz"
      sha256 "f72ea2a04a3ee843743be4bc2ead33bf435a79179f665c7daf19e8c0d5008282"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://downloads.duobolt.app/linux/cli/aarch64/duobolt-cli-0.7.4.tar.gz"
      sha256 "52c8958f347b291e35b4d7f290c17689cf417c72b87962aabe4ac98993f785c6"
    else
      url "https://downloads.duobolt.app/linux/cli/x86_64/duobolt-cli-0.7.4.tar.gz"
      sha256 "686f90914a9f1c235f513c79d2817e51b46c4fa386bb849ab5a9264b52a9823d"
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
