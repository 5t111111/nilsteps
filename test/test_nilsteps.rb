require 'minitest_helper'

class TestNilsteps < MiniTest::Unit::TestCase
  def test_that_it_has_a_version_number
    refute_nil ::Nilsteps::VERSION
  end
end
