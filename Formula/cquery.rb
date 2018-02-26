class Cquery < Formula
  desc "Low-latency language server supporting multi-million line C++ code-bases"
  homepage "https://github.com/cquery-project/cquery"
  version "v20180215"
  url "https://github.com/cquery-project/cquery/archive/#{version}.tar.gz"
  sha256 "1651672e2e5f9707778ab2b9a0b719596c7cb8bf77f374994abc23baa532148d"
  head "https://github.com/cquery-project/cquery.git"

  revisions = {
    "doctest"   => "b40b7e799deabac916d631d181a7f19f3060acc5",
    "loguru"    => "2c35b5e7251ab5d364b1b3164eccef7b5d2293c5",
    "msgpack-c" => "208595b2620cf6260ce3d6d4cf8543f13b206449",
    "rapidjson" => "daabb88e001f562e1f7df5f44d7fed32a0c107c2",
    "sparsepp"  => "1ca7189fe81ee8c59bf08196852f70843a68a63a",
  }

  resource "doctest" do
    url "https://github.com/onqtam/doctest.git",
        :revision => revisions["doctest"]
  end

  resource "sparsepp" do
    url "https://github.com/greg7mdp/sparsepp.git",
        :revision => revisions["sparsepp"]
  end

  resource "rapidjson" do
    url "https://github.com/miloyip/rapidjson.git",
        :revision => revisions["rapidjson"]
  end

  resource "loguru" do
    url "https://github.com/emilk/loguru.git",
        :revision => revisions["loguru"]
  end

  resource "msgpack-c" do
    url "https://github.com/msgpack/msgpack-c.git",
        :revision => revisions["msgpack-c"]
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

