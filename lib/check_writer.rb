class CheckWriter

  

  def self.amount_to_words(amount, level=0)
    int_amount = amount.to_i
    before_decimal_string = amount_to_words_inner(int_amount, level).strip

    cents = (amount - int_amount) * 100
    if cents == 0
      before_decimal_string
    else
      "#{before_decimal_string} and #{cents.round}/100"
    end
  end

  private

    WORDS10 = %w[one two three four five six seven eight nine]

    def self.word_less_than_10(amount)
      return WORDS10[amount-1]
    end


    def self.amount_to_words_inner(amount, level=0)
      if amount == 0
        ""
      elsif amount < 10
        word_less_than_10 amount
      elsif amount < 20
        words = %w[ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen]
        words[amount-10]
      elsif amount < 100
        words = %w[twenty thirty fourty fifty sixty seventy eighty ninety]
        second_word = words[(amount / 10)-2]
        first_word = amount_to_words(amount % 10)
        "#{second_word} #{first_word}"

      elsif amount < 1000
        hundred_word = word_less_than_10(amount / 100)
        "#{hundred_word} hundred " + amount_to_words(amount % 100)
      else
        modifiers = %w[thousand million billion trillion quadrillion jagillion]
        front_words = amount_to_words( amount / 1000, level+1 )
        back_words = amount_to_words(amount % 1000)
        modifier = ((amount / 1000) % 1000) == 0 ? "" : modifiers[level]
        "#{front_words} #{modifier} #{back_words}".squeeze(' ')
      end
      # # elsif amount < 10_000
      # #   thousand_word = word_less_than_10(amount / 1000)
      # #   "#{thousand_word} thousand " + self.convert(amount % 1000)
      # # elsif amount < 100_000
      # #   thousands_words = convert(amount / 1000)
      # #   "#{thousands_words} thousand " + self.convert(amount % 1000)
      # elsif amount < 1_000_000
      #   thousands_words = amount_to_words(amount / 1000)
      #   "#{thousands_words} thousand " + amount_to_words(amount % 1000)
      # elsif amount < 1_000_000_000
      #   millions_words = amount_to_words(amount / 1_000_000)
      #   "#{millions_words} million " + amount_to_words(amount % 1_000_000)
      # elsif amount < 1_000_000_000_000
      #   billions_words = amount_to_words(amount / 1_000_000_000)
      #   "#{billions_words} billion " + amount_to_words(amount % 1_000_000_000)
      # end

    end
end
