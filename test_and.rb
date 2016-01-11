require 'minitest/autorun'
require 'minitest/pride'
require './and'

class AndTest < Minitest::Test

  def test_one_high_one_low
    gate = And::Double.new
    gate.input_a = 1
    gate.input_b = 0

    assert_equal 0, gate.output
  end

  def test_both_low
    gate = And::Double.new
    gate.input_a = 0
    gate.input_b = 0

    assert_equal 0, gate.output
  end


  def test_both_high
    gate = And::Double.new
    gate.input_a = 1
    gate.input_b = 1

    assert_equal 1, gate.output
  end

  def test_triple_all_low

    gate = And::Triple.new
    gate.input_a = 0
    gate.input_b = 0
    gate.input_c = 0
    assert_equal 0, gate.output
  end

  def test_triple_all_high
    gate = And::Triple.new
    gate.input_a = 1
    gate.input_b = 1
    gate.input_c = 1
    assert_equal 1, gate.output
  end

  def test_triple_two_low
    gate = And::Triple.new
    gate.input_a = 1
    gate.input_b = 0
    gate.input_c = 0
    assert_equal 0, gate.output
  end

  def test_triple_two_high
    gate = And::Triple.new
    gate.input_a = 1
    gate.input_b = 0
    gate.input_c = 1
    assert_equal 0, gate.output
  end

  def test_multi_gate_set_input
    gate = And::Multi.new(4)

    gate.set_input(:a, 1)
    assert_equal 1, gate.get_input(:a)
  end

  def test_multi_two
    gate = And::Multi.new(2)

    gate.set_input(:a, 1)
    gate.set_input(:b, 1)

    assert_equal 1, gate.output
  end

  def test_multi_three
    gate = And::Multi.new(3)

    gate.set_input(:a, 1)
    gate.set_input(:b, 1)
    gate.set_input(:c, 1)

    assert_equal 1, gate.output
  end

  def test_more_multi
    gate = And::Multi.new(5)

    gate.set_input(:a, 1)
    gate.set_input(:b, 1)
    gate.set_input(:c, 0)
    gate.set_input(:d, 1)
    gate.set_input(:e, 1)


    assert_equal 0, gate.output
  end


end
