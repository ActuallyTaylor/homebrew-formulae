class CerealConsole < Formula
  desc "A terminal based macOS Serial Console written in Swift"
  homepage "https://github.com/ActuallyTaylor/cereal"

  url "https://github.com/ActuallyTaylor/cereal.git",
    tag:      "1.3.0",
    revision: "2dbaa54f4d1e0426520de2bb2ba930a80e7ffd7d"

  license "GPL-3.0-or-later"
  head "https://github.com/ActuallyTaylor/cereal.git", branch: "main"

  depends_on xcode: ["13.0", :build]

  depends_on macos: :big_sur

  uses_from_macos "swift" => :build

  def install
    args = if OS.mac?
      ["--disable-sandbox"]
    else
      [""]
    end

    system "swift", "build", *args, "-c", "release"
    bin.install ".build/release/cereal" => "cereal"
  end

  test do
    system bin/"cereal", "-v"
  end
end
