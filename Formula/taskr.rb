class Taskr < Formula
  desc "Keyboard-driven terminal task manager that tells you what to do next"
  homepage "https://github.com/Iliorn/taskr"
  url "https://github.com/Iliorn/taskr/archive/refs/tags/v1.41.0.tar.gz"
  sha256 "897e0de6dd4a862bf07a64783b091509e42e0b8974411c403d8ac2f75ca033c7"
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
