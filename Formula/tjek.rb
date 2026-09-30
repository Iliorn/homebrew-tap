class Tjek < Formula
  desc "Keyboard-driven terminal task manager that tells you what to do next"
  homepage "https://github.com/Iliorn/tjek"
  url "https://github.com/Iliorn/tjek/archive/refs/tags/v1.49.1.tar.gz"
  sha256 "cb989e99c32465080e79dfa3d96723c1b2c815c02bc9d326324e88426b6e734a"
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
