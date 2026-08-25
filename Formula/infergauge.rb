# Homebrew formula for InferGauge. Lives in the tap repo
# <org>/homebrew-infergauge as Formula/infergauge.rb; the release workflow
# fills the url/sha placeholders on every tagged release.
# Users install with:  brew install Nexus-InferGauge/infergauge/infergauge
class Infergauge < Formula
  desc "AI performance testing - load, stress, spike and endurance tests for LLM endpoints"
  homepage "https://infergauge.dev"
  version "0.7.0"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "{{macos-arm64_url}}"
      sha256 "{{macos-arm64_sha}}"
    end
    on_intel do
      url "{{macos-x86_64_url}}"
      sha256 "{{macos-x86_64_sha}}"
    end
  end

  on_linux do
    url "{{linux-x86_64_url}}"
    sha256 "{{linux-x86_64_sha}}"
  end

  def install
    bin.install "infergauge"
  end

  test do
    assert_match "infergauge", shell_output("#{bin}/infergauge --help")
  end
end
