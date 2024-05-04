# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/stack'

class StackTest < Minitest::Test
  def setup
    @stack = Stack.new
    @stack.push!('ruby')
    @stack.push!('python')
    @stack.push!('go')
  end

  def teardown; end

  # BEGIN
  def test_stack_push
    @stack.push!('elixir')
    assert_equal @stack.size, 4
    assert_equal @stack.empty?, false
    assert_equal @stack.to_a, ['ruby', 'python', 'go', 'elixir']
  end

  def test_stack_pop
    @stack.pop!
    assert_equal @stack.size, 2
    assert_equal @stack.empty?, false
    assert_equal @stack.to_a, ['ruby', 'python']
  end

  def test_stack_clear
    @stack.clear!
    assert_equal @stack.to_a, []
    assert_equal @stack.empty?, true
  end
  # END
end

test_methods = StackTest.new({}).methods.select { |method| method.start_with? 'test_' }
raise 'StackTest has not tests!' if test_methods.empty?
