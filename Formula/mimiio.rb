class Mimiio < Formula
  desc "Client library for mimi(R) WebSocket API Service"
  homepage "https://github.com/FairyDevicesRD/libmimiio"
  head "https://github.com/FairyDevicesRD/libmimiio.git"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "pkgconfig" => :build
  depends_on "flac"
  depends_on "poco"
  depends_on "portaudio"

  def install
    system "autoreconf", "-ivf"
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}",
                          "CXXFLAGS=-std=c++11"
    system "make", "all", "install"
  end

  test do
    assert_match "usage: mimiio_file", shell_output("${bin}/mimiio_file")
  end
end
