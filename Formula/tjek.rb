class Tjek < Formula
  desc "Keyboard-driven terminal task manager that tells you what to do next"
  homepage "https://github.com/Iliorn/tjek"
  url "https://github.com/Iliorn/tjek/archive/refs/tags/v1.64.0.tar.gz"
  sha256 "c776b15faf510bcb547ba12a9f7cefbcdbfaf99eaf58981346e298a6cc9a5b63"
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
