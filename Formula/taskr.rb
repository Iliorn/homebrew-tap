class Taskr < Formula
  desc "Keyboard-driven terminal task manager with sequencing and sync"
  homepage "https://github.com/Iliorn/taskr"
  url "https://github.com/Iliorn/taskr/archive/refs/tags/v1.33.1.tar.gz"
  sha256 "b3190bf6c69f4e8e306bcdfa2ebb267cc513396f9469d7655aa6de9db74ca176"
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
