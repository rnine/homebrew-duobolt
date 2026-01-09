class Duobolt < Formula
  desc "Fast duplicate file finder using BLAKE3 hashing"
  homepage "https://duobolt.app"
  version "0.3.133"
  license "Freeware"

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.duobolt.app/mac/cli/aarch64/duobolt-cli-0.3.133.tar.gz"
      sha256 "0f680b0bffea8088447b7f4598999df8031e9711c994eb81190a605ddf431d23"
    else
      url "https://downloads.duobolt.app/mac/cli/x86_64/duobolt-cli-0.3.133.tar.gz"
      sha256 "a3e2371e344b46c294d25e2332c473aad8910bf585364379de04ee0025e87658"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://downloads.duobolt.app/linux/cli/aarch64/duobolt-cli-0.3.133.tar.gz"
      sha256 "34009fb325886ae8343b290e6857341b7993b066523e77d4c318a1d0e040b93d"
    else
      url "https://downloads.duobolt.app/linux/cli/x86_64/duobolt-cli-0.3.133.tar.gz"
      sha256 "56294bffc0548d234ef9825c7ccf3a2599aa54d947f2113b22a20348a86d25cc"
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
