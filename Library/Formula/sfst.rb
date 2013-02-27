require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Sfst < Formula
  homepage 'http://www.ims.uni-stuttgart.de/projekte/gramotron/SOFTWARE/SFST.html'
  url 'ftp://ftp.ims.uni-stuttgart.de/pub/corpora/SFST/SFST-1.4.6g.tar.gz'
  sha1 '567168ad792a73061bed2c521ac08a6b4bd3cb09'

  # depends_on 'cmake' => :build
  # depends_on :x11 # if your formula requires any X11/XQuartz components
  depends_on 'flex' => :optional
  depends_on 'bison' => :optional

  def install
    # ENV.j1  # if your formula's build system can't parallelize

    #system "./configure", "--disable-debug", "--disable-dependency-tracking",
    #                      "--prefix=#{prefix}"
    # system "cmake", ".", *std_cmake_args
    inreplace 'src/Makefile', "PREFIX = /usr/local/", "PREFIX = #{prefix}/"
    system "cd src && make && make install && make maninstall" # if this fails, try separate make/make install steps
  end

  def test
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test SFST`.
    system "#{prefix}/bin/fst-compiler"
  end
end
