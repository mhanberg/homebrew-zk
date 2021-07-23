class Zk < Formula
  desc "Plain text note-taking assistant"
  homepage "https://github.com/mickael-menu/zk"
  url "https://github.com/mickael-menu/zk/archive/refs/tags/v0.6.0.tar.gz"
  sha256 "ec215c7cf7520a34404f89816db790b910912c8373d228d472c941439c475e43"
  license "GPL-3.0-only"

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
