require File.expand_path '../../test_helper.rb', __FILE__

class ParamsValidatorTest < Minitest::Test

  EMAIL_REGEX = /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i

  class TestClass
    attr_reader :params
    include ParamsValidator

    def initialize(params)
      @params = params
    end
  end

  def test_req_when_valid
    TestClass.new({name: "Bob"}).instance_eval do
      req :name
    end

    assert true, true
  end

  def test_req_when_nil
    assert_raises ParamsValidator::RequestInvalid do
      TestClass.new({title: ""}).instance_eval do
        req :name
      end
    end
  end

  def test_req_when_blank
    assert_raises ParamsValidator::RequestInvalid do
      TestClass.new({name: ""}).instance_eval do
        req :name
      end
    end
  end

  def test_req_multiple_arguments
    assert_raises ParamsValidator::RequestInvalid do
      TestClass.new({name: 'Bob'}).instance_eval do
        req :name, :title
      end
    end
  end

  def test_fmt_when_valid
    TestClass.new({email: "Bob@example.com"}).instance_eval do
      fmt :email, EMAIL_REGEX
    end

    assert true, true
  end

  def test_fmt_when_invalid
    assert_raises ParamsValidator::RequestInvalid do
      TestClass.new({email: 'Bob at example.com'}).instance_eval do
        req :email, EMAIL_REGEX
      end
    end
  end

end