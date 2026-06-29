# version: 0.5.0

class Termainer < Formula
  include Language::Python::Virtualenv

  desc "Container observability and operations directly from your terminal"
  homepage "https://github.com/AlanStefanov/termainer"
  url "https://files.pythonhosted.org/packages/source/t/termainer/termainer-0.5.0.tar.gz"
  sha256 "cdd6156e6ee39724e2c1047ad4d7fb2520454bf0dee05bde3b998f36abee3d54"
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
