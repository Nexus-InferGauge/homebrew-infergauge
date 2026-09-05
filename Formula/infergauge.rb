# Homebrew formula for InferGauge. Lives in the tap repo
# <org>/homebrew-infergauge as Formula/infergauge.rb; the release workflow
# fills the url/sha placeholders on every tagged release.
# Users install with:  brew install Nexus-InferGauge/infergauge/infergauge
class Infergauge < Formula
  desc "AI performance testing - load, stress, spike and endurance tests for LLM endpoints"
  homepage "https://infergauge.com"
  version "0.9.3"
  license "BUSL-1.1"

  # Apple Silicon only - GitHub's Intel macOS runner fleet has been drawn
  # down to where those release builds can no longer be scheduled at all.
  on_macos do
    on_arm do
      url "https://github.com/Nexus-InferGauge/infergauge-releases/releases/download/v0.9.3/infergauge-v0.9.3-macos-arm64.tar.gz"
      sha256 "f1abb9a96e959c8ab8ed82c80365c515447299b6ffa418433fac305d9a27e76f"
    end
    on_intel do
      odie "InferGauge no longer ships an Intel macOS build. " \
           "Run it under Rosetta with the arm64 build, or use `pip install infergauge`."
    end
  end

  on_linux do
    url "https://github.com/Nexus-InferGauge/infergauge-releases/releases/download/v0.9.3/infergauge-v0.9.3-linux-x86_64.tar.gz"
    sha256 "9f595877500446f4a3fee5bfd05791aa2f37e35db17e74e0a1d9ddc301bd7c75"
  end

  def install
    bin.install "infergauge"
  end

  test do
    assert_match "infergauge", shell_output("#{bin}/infergauge --help")
  end
end
