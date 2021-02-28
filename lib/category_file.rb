class CategoryFile
  
  #constante
  CATEGORIES_DIR = "#{__dir__}/../categories"

  #atributos
  attr_reader :category_name, :file

  #construtor
  def initialize(category_name)
    @category_name = category_name
    @file = create_file()
  end

  #metodos
  def add_line(expense)
    file.write expense
    file.close
  end 
  
  def content()
    file.read()
  end

  def self.all()    #metodo de classe, não voltado para um objeto da classe, mas sim para a classe em si
    files = []
    Dir.each_child(CATEGORIES_DIR).each do |filename|
      files << new(filename.delete_suffix('.csv'))
    end
    files
  end
  
  #metodos privados
  private
  
  def create_file()
    category_file_path = "./categories/#{category_name}.csv"
    category_file = File.open(category_file_path, "a+")
    if File.empty?(category_file)
      category_file.puts ('date,category,title,amount')
    end
    category_file
  end
  
end
