class Zk < Formula
  desc "Plain text note-taking assistant"
  homepage "https://github.com/mickael-menu/zk"
  url "https://github.com/mickael-menu/zk/archive/refs/tags/v0.8.0.tar.gz"
  sha256 "b1967e93469aa6abdc49d0cbd21f603576bcf09d94c2a13a6dce78bbf2983805"
  license "GPL-3.0-only"

  bottle do
    root_url "https://github.com/mhanberg/homebrew-zk/releases/download/zk-0.8.0"
    sha256 cellar: :any,                 catalina:     "5aba83544f414b29498c4fc565d0b14e217d5c2465a052f724eddb60daf1b574"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f6a55d183206f4d60b20825a7e1ff9d3f4b1c4f07dd2b8092b98572ff245d55b"
  end

  depends_on "go" => :build

  depends_on "icu4c"
  depends_on "sqlite3"

  def install
    system "go", "build", *std_go_args, "-tags", "fts5,icu", "-ldflags", "-X=main.Version=#{version} -X=main.Build=brew"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test zk`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "true"
  end
end
