# version: 0.5.2a0

class Termainer < Formula
  include Language::Python::Virtualenv

  desc "Container observability and operations directly from your terminal"
  homepage "https://github.com/AlanStefanov/termainer"
  url "https://files.pythonhosted.org/packages/source/t/termainer/termainer-0.5.2a0.tar.gz"
  sha256 "4362fdf0c3899d421e089f5fc187f85f5051c2667300ff82a7634c3b3923bd5f"
  license "MIT"

  depends_on "python@3.11"

  def install
    virtualenv_create(libexec, "python3.11")
    system libexec/"bin/pip", "install", buildpath
    bin.install_symlink libexec/"bin/termainer"
  end

  test do
    assert_match "termainer", shell_output("#{bin}/termainer --help")
  end
end
