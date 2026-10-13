# Homebrew formula for InferGauge. Lives in the tap repo
# <org>/homebrew-infergauge as Formula/infergauge.rb; the release workflow
# fills the url/sha placeholders on every tagged release.
# Users install with:  brew install Nexus-InferGauge/infergauge/infergauge
class Infergauge < Formula
  desc "AI performance testing - load, stress, spike and endurance tests for LLM endpoints"
  homepage "https://infergauge.com"
  version "1.1.0"
  license "BUSL-1.1"

  # Apple Silicon only - GitHub's Intel macOS runner fleet has been drawn
  # down to where those release builds can no longer be scheduled at all.
  on_macos do
    on_arm do
      url "https://github.com/Nexus-InferGauge/infergauge-releases/releases/download/v1.1.0/infergauge-v1.1.0-macos-arm64.tar.gz"
      sha256 "a14cc85c2b8e98ebddc392e6c2d760bd52e31c5176ecca07e38fcc7284416bbe"
    end
    on_intel do
      odie "InferGauge no longer ships an Intel macOS build. " \
           "Run it under Rosetta with the arm64 build, or use `pip install infergauge`."
    end
  end

  on_linux do
    url "https://github.com/Nexus-InferGauge/infergauge-releases/releases/download/v1.1.0/infergauge-v1.1.0-linux-x86_64.tar.gz"
    sha256 "7f74fc75ce4594c18dbb9a20b95228027bacc657f2953eed631236652dc380af"
  end

  def install
    bin.install "infergauge"
  end

  test do
    assert_match "infergauge", shell_output("#{bin}/infergauge --help")
  end
end
