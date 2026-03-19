class Conduit < Formula
  desc "A lightweight local terminal chat application"
  homepage "https://github.com/Yoshi-tech/Conduit"
  url "https://github.com/Yoshi-tech/Conduit/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "2d07b3b4a17374dd88f56d640c3179e4c6b6107cf081fb7659e83bfdddce0806"
  license "MIT"

  depends_on "ncurses"

  def install
    system "make"
    bin.install "chatServer" => "conduit-server"
    bin.install "chatClient" => "conduit"
  end

  def caveats
    <<~EOS
      To start a chat server:
        conduit-server

      To join a chat:
        conduit <hostname>

      Find your hostname with:
        hostname
    EOS
  end

  test do
    system "#{bin}/conduit-server", "--version"
  end
end
