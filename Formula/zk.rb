class Zk < Formula
  desc "Plain text note-taking assistant"
  homepage "https://github.com/mickael-menu/zk"
  url "https://github.com/mickael-menu/zk/archive/refs/tags/v0.9.0.tar.gz"
  sha256 "102754f2722e7e4ff0a83715085c8bfdac090b440f89020123481a95b566730f"
  license "GPL-3.0-only"

  head "https://github.com/mickael-menu/zk.git", branch: "main"

  bottle do
    root_url "https://github.com/mhanberg/homebrew-zk/releases/download/zk-0.9.0"
    sha256 cellar: :any,                 big_sur:      "972cc0e12c3a275a208f74e97991bd25f6e4bfb4ac8416964188d972191e0442"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e5687d3e89b780cba6778067e681e7055b315cbf005ae3a7cc08bc1832a2de84"
  end

  depends_on "go" => :build

  depends_on "icu4c"
  depends_on "sqlite3"

  def install
    system "go", "build", *std_go_args, "-tags", "fts5,icu", "-ldflags", "-X=main.Version=#{version} -X=main.Build=brew"
  end

  test do
    system "#{bin}/zk init --no-input"
    system "#{bin}/zk index --no-input"
    (testpath/"testnote.md").write "note content"
    (testpath/"anothernote.md").write "todolist"

    output = pipe_output("#{bin}/zk list --quiet").chomp
    assert_match "note content", output
    assert_match "todolist", output
  end
end
