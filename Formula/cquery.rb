class Cquery < Formula
  desc "Low-latency language server supporting multi-million line C++ code-bases"
  homepage "https://github.com/cquery-project/cquery"
  version "v2018-01-23@1825"
  url "https://github.com/cquery-project/cquery/archive/#{version}.tar.gz"
  sha256 "ff0a156638e582e7dd6af6ac5c4c364a07b216790308e1f80a982802854c85e7"
  head "https://github.com/cquery-project/cquery.git"

  resource "doctest" do
    url "https://github.com/onqtam/doctest.git",
        :revision => "79a379827251cd819c5286070834ccd0ac628af9"
  end

  resource "sparsepp" do
    url "https://github.com/greg7mdp/sparsepp.git",
        :revision => "6bfe3b4bdb364993e612d6bb729d680cf4c77649"
  end

  resource "rapidjson" do
    url "https://github.com/miloyip/rapidjson.git",
        :revision => "83f149e70eca569a51a81dd94c49d5a0eff3992d"
  end

  resource "loguru" do
    url "https://github.com/emilk/loguru.git",
        :revision => "37e48808d720194199bc273be4184402a0bc394a"
  end

  resource "msgpack-c" do
    url "https://github.com/msgpack/msgpack-c.git",
        :revision => "208595b2620cf6260ce3d6d4cf8543f13b206449"
  end

  def install
    if build.stable?
      (buildpath/"third_party/doctest").install resource("doctest")
      (buildpath/"third_party/sparsepp").install resource("sparsepp")
      (buildpath/"third_party/rapidjson").install resource("rapidjson")
      (buildpath/"third_party/loguru").install resource("loguru")
      (buildpath/"third_party/msgpack-c").install resource("msgpack-c")
    end
    system "./waf", "configure", "--prefix=#{prefix}"
    system "./waf", "build"
    system "./waf", "install"
  end
end

