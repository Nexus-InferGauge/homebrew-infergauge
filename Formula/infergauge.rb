# Homebrew formula for InferGauge. Lives in the tap repo
# <org>/homebrew-infergauge as Formula/infergauge.rb; the release workflow
# fills the url/sha placeholders on every tagged release.
# Users install with:  brew install Nexus-InferGauge/infergauge/infergauge
class Infergauge < Formula
  desc "AI performance testing - load, stress, spike and endurance tests for LLM endpoints"
  homepage "https://infergauge.dev"
  version "0.7.4"
  license "BUSL-1.1"

  # Apple Silicon only - GitHub's Intel macOS runner fleet has been drawn
  # down to where those release builds can no longer be scheduled at all.
  on_macos do
    on_arm do
      url "https://github.com/Nexus-InferGauge/infergauge-releases/releases/download/v0.7.4/infergauge-v0.7.4-macos-arm64.tar.gz"
      sha256 "cbf43bf8216c90817636281dd9316f40974abdf971d0b2c1f7bf6395e08d0347"
    end
    on_intel do
      odie "InferGauge no longer ships an Intel macOS build. " \
           "Run it under Rosetta with the arm64 build, or use `pip install infergauge`."
    end
  end

  on_linux do
    url "https://github.com/Nexus-InferGauge/infergauge-releases/releases/download/v0.7.4/infergauge-v0.7.4-linux-x86_64.tar.gz"
    sha256 "001bec07900e033c06f2beb683957bf4e803556956b5e9cd6909aa656b0a4e82"
  end

  def install
    bin.install "infergauge"
  end

  test do
    assert_match "infergauge", shell_output("#{bin}/infergauge --help")
  end
end
