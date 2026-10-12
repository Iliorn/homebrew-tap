class Tjek < Formula
  desc "Keyboard-driven terminal task manager that tells you what to do next"
  homepage "https://github.com/Iliorn/tjek"
  url "https://github.com/Iliorn/tjek/archive/refs/tags/v1.57.0.tar.gz"
  sha256 "82c15621b99243c60d505d95c830194ffb35e4614aa8fbbdb95bb18747d29a3f"
  license "MIT"
  head "https://github.com/Iliorn/tjek.git", branch: "main"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X main.appVersion=v#{version}"
    system "go", "build", *std_go_args(ldflags: ldflags), "."
  end

  test do
    assert_equal "v#{version}", shell_output("#{bin}/tjek --version").strip
  end
end
