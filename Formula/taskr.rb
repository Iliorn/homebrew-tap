class Taskr < Formula
  desc "Keyboard-driven terminal task manager with sequencing and sync"
  homepage "https://github.com/Iliorn/taskr"
  url "https://github.com/Iliorn/taskr/archive/refs/tags/v1.30.2.tar.gz"
  sha256 "efa5a1d9dbbec346dd2a6c126a552cb443914c535209311c69ada16851a978c5"
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
