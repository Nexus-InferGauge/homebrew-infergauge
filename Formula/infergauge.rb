# Homebrew formula for InferGauge. Lives in the tap repo
# <org>/homebrew-infergauge as Formula/infergauge.rb; the release workflow
# fills the url/sha placeholders on every tagged release.
# Users install with:  brew install Nexus-InferGauge/infergauge/infergauge
class Infergauge < Formula
  desc "AI performance testing - load, stress, spike and endurance tests for LLM endpoints"
  homepage "https://infergauge.com"
  version "0.8.1"
  license "BUSL-1.1"

  # Apple Silicon only - GitHub's Intel macOS runner fleet has been drawn
  # down to where those release builds can no longer be scheduled at all.
  on_macos do
    on_arm do
      url "https://github.com/Nexus-InferGauge/infergauge-releases/releases/download/v0.8.1/infergauge-v0.8.1-macos-arm64.tar.gz"
      sha256 "f1aaa34cf5884ffa88604d90ce8b796150926f783e333d89e44fa3bb1fe5e990"
    end
    on_intel do
      odie "InferGauge no longer ships an Intel macOS build. " \
           "Run it under Rosetta with the arm64 build, or use `pip install infergauge`."
    end
  end

  on_linux do
    url "https://github.com/Nexus-InferGauge/infergauge-releases/releases/download/v0.8.1/infergauge-v0.8.1-linux-x86_64.tar.gz"
    sha256 "c2d92feac08a894979cfbef1741e87d48594de06a35a6c49fd36f633c610fc0c"
  end

  def install
    bin.install "infergauge"
  end

  test do
    assert_match "infergauge", shell_output("#{bin}/infergauge --help")
  end
end
