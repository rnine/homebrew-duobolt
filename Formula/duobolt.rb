class Duobolt < Formula
  desc "Fast duplicate file finder using BLAKE3 hashing"
  homepage "https://duobolt.app"
  version "0.7.5"
  license "Freeware"

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.duobolt.app/mac/cli/aarch64/duobolt-cli-0.7.5.tar.gz"
      sha256 "6ddeee22d9f8816c7526f5be6c8f64f2a5f0eec576848d51eb99bda2a32c7c2a"
    else
      url "https://downloads.duobolt.app/mac/cli/x86_64/duobolt-cli-0.7.5.tar.gz"
      sha256 "cce4c43ab5df1ae0f5ae22712a043ca9c37017052386ec2d12239640838710b0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://downloads.duobolt.app/linux/cli/aarch64/duobolt-cli-0.7.5.tar.gz"
      sha256 "dade34f6b35de586156afe12bab5024069e1bbe55ffc8b05af02ea6741d3c54d"
    else
      url "https://downloads.duobolt.app/linux/cli/x86_64/duobolt-cli-0.7.5.tar.gz"
      sha256 "3e2746e17b8890109615aa8fd62e1c3aea8a8d9e54a6f145ea4deaa927acebba"
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
