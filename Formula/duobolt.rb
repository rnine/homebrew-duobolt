class Duobolt < Formula
  desc "Fast duplicate file finder using BLAKE3 hashing"
  homepage "https://duobolt.app"
  version "0.4.0"
  license "Freeware"

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.duobolt.app/mac/cli/aarch64/duobolt-cli-0.4.0.tar.gz"
      sha256 "b28e59c2869ae5c84bfc11dd3202ab33291ac6eb8fc5953d23b3da30a64cba19"
    else
      url "https://downloads.duobolt.app/mac/cli/x86_64/duobolt-cli-0.4.0.tar.gz"
      sha256 "975acb90b263ce0da9eb6e9c0ceb4c908c5147f9842aad9eaf5008f29391c60c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://downloads.duobolt.app/linux/cli/aarch64/duobolt-cli-0.4.0.tar.gz"
      sha256 "58933d88b099b4c260cc67d85591587c1daf341a7a6c6f02b38de89b4adca966"
    else
      url "https://downloads.duobolt.app/linux/cli/x86_64/duobolt-cli-0.4.0.tar.gz"
      sha256 "a3155e634ae6fc717bf626f97aacb7a5c44bd6baa591c153d9ba8e7c7ff35828"
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
