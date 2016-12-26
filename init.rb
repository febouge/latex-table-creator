require './table.rb'
require './latex_table_writer.rb'

table = Table.new(2, 2, [1, 2, 3, 4])
table.show_data
LatexTableWriter.export_latex_table(table, 'gestor.rb')
