class Zk < Formula
  desc "Plain text note-taking assistant"
  homepage "https://github.com/mickael-menu/zk"
  url "https://github.com/mickael-menu/zk/archive/refs/tags/v0.7.0.tar.gz"
  sha256 "c68168a99950598e2ecfc35aa75bbd9120ed958ce1c39a77c340c4e7f27f6de5"
  license "GPL-3.0-only"

  bottle do
    root_url "https://github.com/mhanberg/homebrew-zk/releases/download/zk-0.6.0"
    sha256 cellar: :any,                 catalina:     "0bec5b8213fe886fe883d24c2dcb5693fcddb757462676924c3ace2f3b933374"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e9531f635e0d95f2427c6d8587588a7031049a30783a02959d506abf42afe7ab"
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
