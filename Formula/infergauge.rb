# Homebrew formula for InferGauge. Lives in the tap repo
# <org>/homebrew-infergauge as Formula/infergauge.rb; the release workflow
# fills the url/sha placeholders on every tagged release.
# Users install with:  brew install Nexus-InferGauge/infergauge/infergauge
class Infergauge < Formula
  desc "AI performance testing - load, stress, spike and endurance tests for LLM endpoints"
  homepage "https://infergauge.com"
  version "0.9.2"
  license "BUSL-1.1"

  # Apple Silicon only - GitHub's Intel macOS runner fleet has been drawn
  # down to where those release builds can no longer be scheduled at all.
  on_macos do
    on_arm do
      url "https://github.com/Nexus-InferGauge/infergauge-releases/releases/download/v0.9.2/infergauge-v0.9.2-macos-arm64.tar.gz"
      sha256 "6fc7eb0d5f83997be125a0c6c96685753dcff75eae86700d2753b49b1e8addc5"
    end
    on_intel do
      odie "InferGauge no longer ships an Intel macOS build. " \
           "Run it under Rosetta with the arm64 build, or use `pip install infergauge`."
    end
  end

  on_linux do
    url "https://github.com/Nexus-InferGauge/infergauge-releases/releases/download/v0.9.2/infergauge-v0.9.2-linux-x86_64.tar.gz"
    sha256 "628eaca1249cc9d6d99ba997c77d4b6a4b94ceab7c23008b553c827b2d46eb94"
  end

  def install
    bin.install "infergauge"
  end

  test do
    assert_match "infergauge", shell_output("#{bin}/infergauge --help")
  end
end
