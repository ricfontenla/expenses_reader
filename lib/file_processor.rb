class FileProcessor

  #atributor
  attr_reader :file_path

  #construtor
  def initialize(file_path)
    @file_path = file_path
  end

  #metodos publicos
  def process()
    file = File.read(file_path) #le o conteudo do arquivo em uma string

    csv = CSV.parse(file, headers: true, liberal_parsing: true)

    csv.each do |row|
      expense = row.to_h
      category = fetch_category(expense)
      CategoryFile.new(category).add_line(row)
    end
  end

  #metodos privados
  private

  def fetch_category(expense)
    #Guard Clause
    return expense['category'] if !expense['category'].nil?
    #condicao ? caso_true : caso_false      #operador ternário
    expense['amount'].to_f.positive? ? 'impostos_taxas' : 'pagamentos'
  end

end
