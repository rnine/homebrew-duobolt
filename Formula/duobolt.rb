class Duobolt < Formula
  desc "Fast duplicate file finder using BLAKE3 hashing"
  homepage "https://duobolt.app"
  version "0.3.123"
  license "Freeware"

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.duobolt.app/mac/cli/aarch64/duobolt-cli-0.3.123.tar.gz"
      sha256 "2c813ddc688aa557f02a799887cd5d5009b5bb0e95d3a9ff1e04a07c1ad457f7"
    else
      url "https://downloads.duobolt.app/mac/cli/x86_64/duobolt-cli-0.3.123.tar.gz"
      sha256 "bda63aa0c1b9b76c5e4a6cf4efd4b90825deb5c8123bed96126941976974cdb6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://downloads.duobolt.app/linux/cli/aarch64/duobolt-cli-0.3.123.tar.gz"
      sha256 "848a678b24c444278d44e0b6fccc7cb6038f2b6bc50b36235dfa0ead799fe71d"
    else
      url "https://downloads.duobolt.app/linux/cli/x86_64/duobolt-cli-0.3.123.tar.gz"
      sha256 "e96f04a202a424cc81c56fcf714077e61bf3f4ebb9c25d5b4af5c386c3426dec"
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
