class Duobolt < Formula
  desc "Fast duplicate file finder using BLAKE3 hashing"
  homepage "https://duobolt.app"
  version "0.3.95"
  license "Freeware"

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.duobolt.app/mac/cli/aarch64/duobolt-cli-0.3.95.tar.gz"
      sha256 "af9aed0df27898b1fe2a7a42fb8439be2926869708e11eea5ccb951ad1c1a1d5"
    else
      url "https://downloads.duobolt.app/mac/cli/x86_64/duobolt-cli-0.3.95.tar.gz"
      sha256 "1206ab35f04706795f20d58ce4a282039ae12b63b41c44d74ec9ad424588b284"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://downloads.duobolt.app/linux/cli/aarch64/duobolt-cli-0.3.95.tar.gz"
      sha256 "c57c8ebc1c6aa05ccc83f5b3baf4e5a3a3a1aab8ef59f1dd1ff40cb7b1f8a363"
    else
      url "https://downloads.duobolt.app/linux/cli/x86_64/duobolt-cli-0.3.95.tar.gz"
      sha256 "95db72362c29b1c9e8fc38679120a46f346f8cb29a7a3bdf2a1888ed97bcab61"
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
