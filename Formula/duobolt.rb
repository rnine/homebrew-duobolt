class Duobolt < Formula
  desc "Fast duplicate file finder using BLAKE3 hashing"
  homepage "https://duobolt.app"
  version "0.3.88"
  license "Freeware"

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.duobolt.app/mac/cli/aarch64/duobolt-cli-0.3.88.tar.gz"
      sha256 "b82e1ca2e7c708daf0ea0e79f3f72a78a1e89032b87e82a363656135ed0db457"
    else
      url "https://downloads.duobolt.app/mac/cli/x86_64/duobolt-cli-0.3.88.tar.gz"
      sha256 "bcefddc5cf86ff2a6e5f89e4c6a9300b21376485479dc9599a19b12ab2134554"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://downloads.duobolt.app/linux/cli/aarch64/duobolt-cli-0.3.88.tar.gz"
      sha256 "e5018397a28af279c7d9cdc9396ea5466b7d9cc2eadf79d20db4f60767a085fc"
    else
      url "https://downloads.duobolt.app/linux/cli/x86_64/duobolt-cli-0.3.88.tar.gz"
      sha256 "60f00728c197dc65dfa817d9294ba8c8b7171f0558c99516e59853e08d9a8e44"
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
