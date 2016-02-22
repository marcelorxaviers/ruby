require File.expand_path "../test_helper.rb", __FILE__

class AppTest < Minitest::Test

  include Rack::Test::Methods

  def app
    EngineeringApp
  end

  def test_index
    get '/'
    assert last_response.ok?
    assert_match "Bright Funds Engineering Application", last_response.body
  end

  def test_apply_get
    get '/apply'
    refute last_response.ok?
  end

  def test_apply_post
    post "/apply", name: "Bob", email: "bob@example.com", github_profile_url: "https://github.com/example", cover_letter: "Words", "g-recaptcha-response" => "1234"
    assert last_response.ok?
  end

  def test_missing_parameter_apply_post
    post "/apply", name: "Bob", github_profile_url: "https://github.com/example", cover_letter: "Words", "g-recaptcha-response" => "1234"
    refute last_response.ok?
  end
end