class FsearchMac < Formula
  desc "FSearch fork for macOS: FSEvents live monitoring + headless fsearch-cli"
  homepage "https://github.com/NomaDamas/fsearch-mac"
  url "https://github.com/NomaDamas/fsearch-mac/archive/refs/tags/0.3-mac1.tar.gz"
  sha256 "cf30d6071e166fa8ef5201fe780c9720309cb376f9286051e6bcf38ed88fc35c"
  version "0.3-mac1"
  license "GPL-2.0-or-later"

  depends_on "gettext" => :build
  depends_on "itstool" => :build
  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "pkg-config" => :build
  depends_on "glib"
  depends_on "gtk+3"
  depends_on "icu4c"
  depends_on "pcre2"

  def install
    ENV.prepend_path "PKG_CONFIG_PATH", formula_opt_lib("icu4c")/"pkgconfig"

    system "meson", "setup", "build", *std_meson_args
    system "meson", "compile", "-C", "build"
    system "meson", "install", "-C", "build"
  end

  test do
    assert_match "fsearch-cli", shell_output("#{bin}/fsearch-cli --version")

    (testpath/"tree/dir").mkpath
    (testpath/"tree/dir/sample.txt").write("hello")
    system bin/"fsearch-cli", "index", "--db", testpath/"test.db",
           "--include", testpath/"tree"
    output = shell_output("#{bin}/fsearch-cli search --db #{testpath}/test.db sample.txt")
    assert_match "sample.txt", output
  end
end
