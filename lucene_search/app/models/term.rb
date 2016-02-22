class Term

  @@punctuation = "[.,?!:;\s\t\n]"

  attr_reader :regex

  def initialize(original_term)
    @original_term = original_term.strip
    @regex = self_regexing
    @negation = @original_term[0] == '-' 
  end

  def in?(string)
    r = regex =~ string.downcase || @original_term.downcase == string.downcase
    return negation? ? !r : r
  end

  def to_s
    @original_term
  end

  private

  def self_regexing
    term = @original_term.dup.downcase
    term = /[-*]/ =~ term[0]  ? term[1..-1] : "(#{@@punctuation}|\\A)#{term}"
    term = term[-1] == '*' ? term[0..-2] : "#{term}(#{@@punctuation}|\\Z)" 
    term.gsub!('"', '')
    term.gsub!('*', '\w*')
    Regexp.new(term)
  end

  def negation?
    @negation
  end

end
