class Taskr < Formula
  desc "Keyboard-driven terminal task manager with sequencing and sync"
  homepage "https://github.com/Iliorn/taskr"
  url "https://github.com/Iliorn/taskr/archive/refs/tags/v1.37.0.tar.gz"
  sha256 "5872cb5eb36161808ec95c9adc53232323a8a5b9633f87e60f5f5faf17fe273f"
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
