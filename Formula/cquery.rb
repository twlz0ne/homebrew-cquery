class Cquery < Formula
  desc "Low-latency language server supporting multi-million line C++ code-bases"
  homepage "https://github.com/cquery-project/cquery"

  head "https://github.com/cquery-project/cquery.git"

  def install
    system "./waf", "configure", "--prefix=#{prefix}"
    system "./waf", "build"
    system "./waf", "install"
  end
end
