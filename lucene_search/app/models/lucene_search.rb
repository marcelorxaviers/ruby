class LuceneSearch

  attr_reader :query

  def initialize(query)
    @query = query
  end

  def test(string)
    begin
      evaluate(string)
    rescue Exception
      false
    end
  end

  def test!(string)
    evaluate(string)
  end

  def valid?
    begin
      stderr = $stderr
      $stderr.reopen(IO::NULL)
      RubyVM::InstructionSequence.compile(parse('validating_query'))
      return true
    rescue Exception
      false
    ensure
      $stderr.reopen(stderr)
    end
  end

  private

  def parse(string)
    parsed = @query.dup
    @query.split(/AND|OR|\(|\)/).reject(&:blank?).each do |t|
      term = Term.new(t)
      parsed.sub!(term.to_s, term.in?(string).to_s)
    end
    parsed.gsub('AND', '&&').gsub('OR', '||')
  end

  def evaluate(string)
    raise "Invalid query: Look for missing terms and parentheses" unless valid?
    eval(parse(string)) ? true : false
  end

end
