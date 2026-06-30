# version: 0.5.1

class Termainer < Formula
  include Language::Python::Virtualenv

  desc "Container observability and operations directly from your terminal"
  homepage "https://github.com/AlanStefanov/termainer"
  url "https://files.pythonhosted.org/packages/source/t/termainer/termainer-0.5.1.tar.gz"
  sha256 "119043123eb10169ca35e02a77241956058626300a716c00c4e3e3f91e5011f4"
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
