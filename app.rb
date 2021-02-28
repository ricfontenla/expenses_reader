require 'csv'
require 'fileutils'
require_relative './lib/category.rb'
require_relative './lib/expense.rb'
require_relative './lib/category_file.rb'
require_relative './lib/file_processor.rb'

DATA_DIR = "#{__dir__}/data"

puts
puts('Processador de arquivos Nubank')
puts

Dir.each_child(DATA_DIR).each do |filename|
  fp = FileProcessor.new("./data/#{filename}")
  fp.process()
  FileUtils.mv("./data/#{filename}", "./processed/")
end

CategoryFile.all.each do |cf|
  c = Category.new(cf.category_name(), cf.content())
  puts c
  puts c.expenses_month
  puts "----------------------------------\n\n"
end
