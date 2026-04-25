class Duobolt < Formula
  desc "Fast duplicate file finder using BLAKE3 hashing"
  homepage "https://duobolt.app"
  version "0.7.6"
  license "Freeware"

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.duobolt.app/mac/cli/aarch64/duobolt-cli-0.7.6.tar.gz"
      sha256 "c6f25a0e4c742feb90f0a03cc28f6e93430a4413835257864f7e0b68178a2749"
    else
      url "https://downloads.duobolt.app/mac/cli/x86_64/duobolt-cli-0.7.6.tar.gz"
      sha256 "6b78ee0445c7b4c64a35449755e63f1a78bd450277dbd7cf758951a8397179fd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://downloads.duobolt.app/linux/cli/aarch64/duobolt-cli-0.7.6.tar.gz"
      sha256 "4b1485c00e11ce7b6f1ae255c47caafab659a6d56264ba3adced73b0903abe2f"
    else
      url "https://downloads.duobolt.app/linux/cli/x86_64/duobolt-cli-0.7.6.tar.gz"
      sha256 "c146d89fdbc540805b1001ed598ed8f0c63aaa27fb0496b8db40649566068e69"
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
