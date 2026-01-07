class Duobolt < Formula
  desc "Fast duplicate file finder using BLAKE3 hashing"
  homepage "https://duobolt.app"
  version "0.3.120"
  license "Freeware"

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.duobolt.app/mac/cli/aarch64/duobolt-cli-0.3.120.tar.gz"
      sha256 "5e3e9e1d37d7a1f2db1207e785d46b1b80b73b4d769bba8915e96eeb7b1cfa89"
    else
      url "https://downloads.duobolt.app/mac/cli/x86_64/duobolt-cli-0.3.120.tar.gz"
      sha256 "754c71acb9b7caa66c795770dbaa8bc18c81c70860b089c5067fb3d24eaeeeff"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://downloads.duobolt.app/linux/cli/aarch64/duobolt-cli-0.3.120.tar.gz"
      sha256 "ce99ebd68cbbb6d298d5eae7610bbb7ff72261ecbe8167cf88f57c59db91aa57"
    else
      url "https://downloads.duobolt.app/linux/cli/x86_64/duobolt-cli-0.3.120.tar.gz"
      sha256 "0839fea35d0c281fba5962d434481daf926bfc68859eec4344c400b5f3674085"
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
