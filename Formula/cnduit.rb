class Cnduit < Formula
  desc "A lightweight local terminal chat application"
  homepage "https://github.com/Yoshi-tech/Conduit"
  url "https://github.com/Yoshi-tech/Conduit/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "1d01702a7113f6a446665e2ce0e12b59da1243f642eae29382c8d0a8a58dd781"
  license "MIT"

  depends_on "ncurses"
  depends_on "pkg-config" => :build

  def install
    system "make"
    bin.install "chatServer" => "cnduit-server"
    bin.install "chatClient" => "cnduit"
  end

  def caveats
    <<~EOS
      To start a chat server:
        cnduit-server

      To join a chat:
        cnduit <hostname>

      Find your hostname with:
        hostname
    EOS
  end

  test do
    assert_predicate bin/"cnduit-server", :exist?
  end
end
