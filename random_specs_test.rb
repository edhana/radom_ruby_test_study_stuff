require 'minitest/autorun'

describe "Testing classes just for fun" do
  it "should create a class in a different way" do
    custom_class = Class.new do
      attr_accessor :test_attr

      def initialize(argv)
        @test_attr = argv
      end
    end

    instance = custom_class.new "attribute value"

    assert_equal "attribute value", instance.test_attr
  end
end
