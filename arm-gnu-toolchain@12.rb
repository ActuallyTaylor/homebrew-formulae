class ArmGnuToolchainAT12 < Formula
    desc "Community supported pre-built GNU compiler toolchain for Arm CPUs."
    homepage "https://developer.arm.com/downloads/-/arm-gnu-toolchain-downloads"
    url "https://armkeil.blob.core.windows.net/developer/Files/downloads/gnu/12.3.rel1/binrel/arm-gnu-toolchain-12.3.rel1-darwin-x86_64-arm-none-eabi.tar.xz"
     sha256 "3b2eee0bdf71c1bbeb3c3b7424fbf7bd9d5c3f0f5a3a4a78159c9e3ad219e7bd"
    
    on_macos do
        on_arm do
            url "https://armkeil.blob.core.windows.net/developer/Files/downloads/gnu/12.3.rel1/binrel/arm-gnu-toolchain-12.3.rel1-darwin-arm64-arm-none-eabi.tar.xz"
             sha256 "e6ed8bf930fad9ce33e120ab90b36957b1f779fccaa6de6c9ca9a58982c04291"
        end
    end
    
    
    def install
        bin.install Dir["bin/*"]
        prefix.install Dir["arm-none-eabi", "include", "lib", "libexec", "share"]
    end
    
    test do
        # `test do` will create, run in and delete a temporary directory.
        #
        # This test will fail and we won't accept that! For Homebrew/homebrew-core
        # this will need to be a test that verifies the functionality of the
        # software. Run the test with `brew test arm-gnu-toolchain@12`. Options passed
        # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
        #
        # The installed folder is not in the path, so use the entire path to any
        # executables being tested: `system "#{bin}/program", "do", "something"`.
        system "false"
    end
end
