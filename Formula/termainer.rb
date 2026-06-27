# version: 0.4.0

class Termainer < Formula
  include Language::Python::Virtualenv

  desc "Container observability and operations directly from your terminal"
  homepage "https://github.com/AlanStefanov/termainer"
  url "https://files.pythonhosted.org/packages/source/t/termainer/termainer-0.4.0.tar.gz"
  sha256 "45be4941c0d0db03c2cc797220fb60f31989d59ebdc17c2640d16cb0b768d466"
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
