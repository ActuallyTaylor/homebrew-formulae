class CerealConsole < Formula
  desc "Terminal based serial console"
  homepage "https://github.com/ActuallyTaylor/cereal"
    url "https://github.com/ActuallyTaylor/cereal/archive/refs/tags/1.2.0.tar.gz"
  sha256 "62b76bfe6c5d929d76437a05a24230221c0088b55e2395d2a3affd697acfd51c"
  license "GPL-3.0-or-later"
  head "https://github.com/ActuallyTaylor/cereal.git", branch: "main"

  depends_on xcode: ["13.0", :build]

  depends_on macos: :big_sur

  uses_from_macos "swift" => :build

  def install
    args = if OS.mac?
      ["--disable-sandbox"]
    else
      ["--static-swift-stdlib"]
    end
    system "swift", "build", *args, "-c", "release"
    bin.install ".build/release/cereal" => "cereal"
  end

  test do
    system bin/"cereal", "-h"
  end
end
