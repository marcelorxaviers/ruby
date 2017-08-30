class DomainConstraint
  # This is only necessary because I want to use the same app to handle both domains
  # And I want the same app to handle both domains to make it easier to run the solution.
  def matches?(request)
    request.url.include? 'http://ios.rwdev.io'
  end
end