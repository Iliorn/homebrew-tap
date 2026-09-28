class Taskr < Formula
  desc "Keyboard-driven terminal task manager with sequencing and sync"
  homepage "https://github.com/Iliorn/taskr"
  url "https://github.com/Iliorn/taskr/archive/refs/tags/v1.40.0.tar.gz"
  sha256 "5c78a3390f8dd18e765f8909405b9f61a2c66fa3ce21a7bcd06a0cda32d6475a"
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
