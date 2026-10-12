class Tjek < Formula
  desc "Keyboard-driven terminal task manager that tells you what to do next"
  homepage "https://github.com/Iliorn/tjek"
  url "https://github.com/Iliorn/tjek/archive/refs/tags/v1.57.1.tar.gz"
  sha256 "dd52f9497f47c029b247725ce027c35135071e45ea91df25b761ce15bbb727f9"
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
