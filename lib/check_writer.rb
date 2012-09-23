class CheckWriter

  def self.amount_to_words(amount)
    int_amount = amount.floor
    words = amount_to_words_internal(int_amount).strip
    cents = (amount - int_amount) * 100
    if cents == 0
      words
    else
      "#{words} and #{cents.round}/100"
    end
  end


  private
    def self.amount_to_words_internal(amount, level=0)
      if amount == 0
        ""
      elsif amount <= 20
        words = %w[one two three four five six seven eight nine ten eleven
          twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen
          twenty]
        words[amount-1]
      elsif amount < 100
        words2 = %w[twenty thirty fourty fifty sixty seventy eighty ninety]
        first_word = words2[amount/10-2]
        second_word = amount_to_words(amount%10)
        "#{first_word} #{second_word}".strip
      elsif amount < 1000
        first_part = amount_to_words(amount / 100)
        last_part = amount_to_words(amount % 100)
        "#{first_part} hundred #{last_part}"  
      else
        modifiers = %w[thousand million billion trillion gajillion gooooooooooogle]
        first_part = amount_to_words_internal(amount / 1000, level+1)
        last_part = amount_to_words(amount % 1000)
        modifier = (amount / 1000) % 1000 == 0 ? "" : modifiers[level]
        "#{first_part} #{modifier} #{last_part}".squeeze(' ')
      end
    end

end
