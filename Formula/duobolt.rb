class Duobolt < Formula
  desc "Fast duplicate file finder using BLAKE3 hashing"
  homepage "https://duobolt.app"
  version "0.6.0"
  license "Freeware"

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.duobolt.app/mac/cli/aarch64/duobolt-cli-0.6.0.tar.gz"
      sha256 "b0fb855ed51fab010b9dbc228c972bf2c7daf917b456852550bb8e6bb13a09ad"
    else
      url "https://downloads.duobolt.app/mac/cli/x86_64/duobolt-cli-0.6.0.tar.gz"
      sha256 "a5818fe6420e90181ae8c548eef9d5000e8777c032605a95db840d969114c2d3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://downloads.duobolt.app/linux/cli/aarch64/duobolt-cli-0.6.0.tar.gz"
      sha256 "369c8588d98c9613a20ccac36b4892dca4c829a6152f2bee7ef04414de7fe19f"
    else
      url "https://downloads.duobolt.app/linux/cli/x86_64/duobolt-cli-0.6.0.tar.gz"
      sha256 "9961f00416491bac42b4bb8c260f6ce3ba0c22403b488797236b389b5b402922"
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
