class Expense

  #atributos
  attr_reader :date, :category, :title, :amount

  #construtor
  def initialize(date:, category:, title:, amount:) #key worlds
    @date = Date.parse(date)
    @category = category
    @title = title
    @amount = amount.to_f
  end

  #metodos
  def to_s
    "#{date_format}\t#{category}\t#{title}\t#{amount}"
  end

  def date_format()
    "#{@date.day}/#{month()}"
  end

  def month()
    "#{@date.month}/#{date.year}"
  end
  
end
