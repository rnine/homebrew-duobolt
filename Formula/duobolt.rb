class Duobolt < Formula
  desc "Fast duplicate file finder using BLAKE3 hashing"
  homepage "https://duobolt.app"
  version "0.3.110"
  license "Freeware"

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.duobolt.app/mac/cli/aarch64/duobolt-cli-0.3.110.tar.gz"
      sha256 "889d11fd677c158691e8c718ec18750a3c546785f4e00a57afcb473d60c10e7e"
    else
      url "https://downloads.duobolt.app/mac/cli/x86_64/duobolt-cli-0.3.110.tar.gz"
      sha256 "23ed4a9041fa20d6a4adfa8d7700a06d09454e0f6268bbc757ae56f67178852b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://downloads.duobolt.app/linux/cli/aarch64/duobolt-cli-0.3.110.tar.gz"
      sha256 "a3bd20d6bb9e5e0f91f02de5473a433acdf8870709fe2185516088b6c0b7bad6"
    else
      url "https://downloads.duobolt.app/linux/cli/x86_64/duobolt-cli-0.3.110.tar.gz"
      sha256 "84f3a03d6ec6b6fe96dcf89b6e99df510d618393c571a97f2dd0b21e33e26201"
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
