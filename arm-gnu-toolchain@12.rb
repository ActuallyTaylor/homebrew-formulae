class ArmGnuToolchainAT12 < Formula
  desc "Community supported pre-built GNU compiler toolchain for Arm CPUs."
  homepage "https://developer.arm.com/downloads/-/arm-gnu-toolchain-downloads"
  url "https://armkeil.blob.core.windows.net/developer/Files/downloads/gnu/12.3.rel1/binrel/arm-gnu-toolchain-12.3.rel1-darwin-x86_64-arm-none-eabi.tar.xz"
  sha256 "e6ed8bf930fad9ce33e120ab90b36957b1f779fccaa6de6c9ca9a58982c04291"

  on_macos do
    on_arm do
      url "https://armkeil.blob.core.windows.net/developer/Files/downloads/gnu/12.3.rel1/binrel/arm-gnu-toolchain-12.3.rel1-darwin-arm64-arm-none-eabi.tar.xz"
      sha256 "3b2eee0bdf71c1bbeb3c3b7424fbf7bd9d5c3f0f5a3a4a78159c9e3ad219e7bd"
    end
  end

  def install
    bin.install Dir["bin/*"]
    prefix.install Dir["arm-none-eabi", "include", "lib", "libexec", "share"]
  end

  test do
    system bin / "arm-none-eabi-gcc", "-v"
  end
end
