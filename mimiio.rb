class Mimiio < Formula
  desc "mimi(R) WebSocket API Service client library"
  homepage "https://github.com/FairyDevicesRD/libmimiio"
  head "https://github.com/FairyDevicesRD/libmimiio.git"

  depends_on "poco"
  depends_on "flac"
  depends_on "portaudio"
  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build

  def install
    system "autoreconf", "-ivf"
    # Logger#setChannel API changed since POCO 1.10
    system "sed", "-i", "", "s/pfmtChannel.get()/pfmtChannel/", "src/mimiio.cpp"
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}",
                          "CXXFLAGS=-std=c++11"
    system "make", "all", "install"
  end
end
