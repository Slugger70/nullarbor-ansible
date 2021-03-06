class Capnp < Formula
  homepage "https://capnproto.org/"
  url "https://capnproto.org/capnproto-c++-0.5.2.tar.gz"
  sha256 "23145a0127c2b1629c4b72e6000e04991640e551947fa39fd06710d64bd942a8"

  bottle do
    sha256 "94295e6275fab85b54d334a9994538fe92be8422e2230982a568fe707a4bd17f" => :yosemite
    sha256 "fca129dbeefeea03b0deaa149bc8f1cae8f0b657a13f6ca838398db3a54fc800" => :mavericks
    sha256 "3771b3a8a7be9a1b3e9c872ff632a37f23eea8aab1d4b4725a0e82fb58453141" => :mountain_lion
  end

  needs :cxx11
  option "without-shared", "Disable building shared library variant"

  def install
    args = %W[
      --disable-debug
      --disable-dependency-tracking
      --disable-silent-rules
      --prefix=#{prefix}
    ]

    args << "--disable-shared" if build.without? "shared"

    system "./configure", *args
    system "make"
    system "make", "install"
  end

  test do
    system "#{bin}/capnp", "--version"
  end
end
