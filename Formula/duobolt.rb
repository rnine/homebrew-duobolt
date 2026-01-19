class Duobolt < Formula
  desc "Fast duplicate file finder using BLAKE3 hashing"
  homepage "https://duobolt.app"
  version "0.4.4"
  license "Freeware"

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.duobolt.app/mac/cli/aarch64/duobolt-cli-0.4.4.tar.gz"
      sha256 "36f9db9f6ed787de91b50b93d5ace0ca46df22298896b7a466f79f3aefccac44"
    else
      url "https://downloads.duobolt.app/mac/cli/x86_64/duobolt-cli-0.4.4.tar.gz"
      sha256 "fa538bf341f1bfeef3d9f4c10696b2c0234011a18683c06d670a3551414f80a4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://downloads.duobolt.app/linux/cli/aarch64/duobolt-cli-0.4.4.tar.gz"
      sha256 "66ad861073aff3c147fd5f7e3e5eb95cb1ae9aba79bc109d620cad7954c4eb97"
    else
      url "https://downloads.duobolt.app/linux/cli/x86_64/duobolt-cli-0.4.4.tar.gz"
      sha256 "a23e5f08a894c96a8c1e8b792cbe51e2453567b9b3a31b8e0bb0f780aabadf55"
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
