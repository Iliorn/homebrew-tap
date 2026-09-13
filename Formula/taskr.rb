class Taskr < Formula
  desc "Keyboard-driven terminal task manager with sequencing and sync"
  homepage "https://github.com/Iliorn/taskr"
  url "https://github.com/Iliorn/taskr/archive/refs/tags/v1.36.0.tar.gz"
  sha256 "c9d9dd9d0d63843300c605c647d4c4cbc516ed99ace1b559239b1a6a12a29d0b"
  license "MIT"
  head "https://github.com/Iliorn/taskr.git", branch: "main"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X main.appVersion=v#{version}"
    system "go", "build", *std_go_args(ldflags: ldflags), "."
  end

  test do
    assert_equal "v#{version}", shell_output("#{bin}/taskr --version").strip
  end
end
