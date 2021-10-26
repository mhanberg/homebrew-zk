class Zk < Formula
  desc "Plain text note-taking assistant"
  homepage "https://github.com/mickael-menu/zk"
  url "https://github.com/mickael-menu/zk/archive/refs/tags/v0.7.0.tar.gz"
  sha256 "c68168a99950598e2ecfc35aa75bbd9120ed958ce1c39a77c340c4e7f27f6de5"
  license "GPL-3.0-only"

  bottle do
    root_url "https://github.com/mhanberg/homebrew-zk/releases/download/zk-0.7.0"
    sha256 cellar: :any,                 catalina:     "9467002e34ddab0ddc6230662663714f9c23302603d3e12740ba770619f55f79"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "77c719205adc7c3ee00d4f3b607913d3918c840faec85288948cbe588b98bda0"
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
