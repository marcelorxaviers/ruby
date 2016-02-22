class CoinFactory

  def self.zero
    @@zero ||= Coin.create(representation: 'zero', value: 0.0)
  end

  def self.unknown(value)
    Coin.create(representation: value.to_s, value: value)
  end

  def self.from_float(value)
    parsed = value.try(:to_f).try(:round, 2)
    case parsed.to_s
    when /0\.0?[125]/
      Coin.create(representation: "#{(parsed * 100).to_i}p", value: parsed)
    when /[12]\.0/
      Coin.create(representation: "£#{parsed.to_i}", value: parsed)
    else unknown(parsed)
    end
  end

  def self.from_representation(representation)
    parsed = representation.gsub(/\s/,'').downcase
    case parsed
    when /[125]0?p/
      Coin.create(representation: parsed, value: (parsed.to_f/100).round(2))
    when /£[12]/
      Coin.create(representation: parsed, value: parsed[1].to_f.round(2))
    else zero
    end
  end

end