class Duobolt < Formula
  desc "Fast duplicate file finder using BLAKE3 hashing"
  homepage "https://duobolt.app"
  version "0.3.84"
  license "Freeware"

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.duobolt.app/mac/cli/aarch64/duobolt-cli-0.3.84.tar.gz"
      sha256 "46c81026d2aabad9d51f71d6877399f40c1a7bca179690945a32f82fcd4c1407"
    else
      url "https://downloads.duobolt.app/mac/cli/x86_64/duobolt-cli-0.3.84.tar.gz"
      sha256 "bee5d15ec42e5aa91becf70724948b4ffe715f8b02659d8c2a59c6d930d5ba72"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://downloads.duobolt.app/linux/cli/aarch64/duobolt-cli-0.3.84.tar.gz"
      sha256 "71d99ab657120721be2751d648fce4b49494306e2e3db68b17731363a4aa1c56"
    else
      url "https://downloads.duobolt.app/linux/cli/x86_64/duobolt-cli-0.3.84.tar.gz"
      sha256 "ff1cb19f3394d9cbba77762180668ff121c7c624abe75d58eb8589232c137c13"
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
      Documentation: https://duobolt.app/docs/

      Usage:
        duobolt-cli scan /path/to/folder
        duobolt-cli --help
    EOS
  end
end
