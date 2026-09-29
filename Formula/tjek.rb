class Tjek < Formula
  desc "Keyboard-driven terminal task manager that tells you what to do next"
  homepage "https://github.com/Iliorn/tjek"
  url "https://github.com/Iliorn/tjek/archive/refs/tags/v1.43.0.tar.gz"
  sha256 "6650fa77e0c82b346b07970c8de8c16f8eb18ff61bdc43ef11bf1963b520e3c5"
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
