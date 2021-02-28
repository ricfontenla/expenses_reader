class Category

  attr_reader :name, :expenses

  #construtor
  def initialize(name, data)
    @name = name
    @expenses = []
    build_expenses(data)
  end

  #metodos

  def total_amount
    expenses().sum(&:amount)
  end  

  def expenses_month
    result = ""
    expenses.group_by(&:month).each_pair do |k,v|
      result << "#{k}\t#{v.sum(&:amount).round(2)}\n"
    end
    result
  end

  def to_s
    "#{name()}\tTotal Gasto: #{total_amount.round(2)}"
  end

  #metodos privados
  private

  def build_expenses(data)
    csv_data = CSV.parse(data, headers: true, liberal_parsing: true)
    csv_data.each do |row|
      expense_hash = row.to_h
      @expenses << Expense.new(date: expense_hash['date'],category: self , title: expense_hash['title'], amount: expense_hash['amount'])
    end
  end
  
end
