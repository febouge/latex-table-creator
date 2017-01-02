# Contants for the application
class Constants
  # Menu constants
  MENU_HEADER = "Welcome, please select an option:\n".freeze
  MENU_OPTION_1 = "1. Define new table. \n".freeze
  MENU_OPTION_2 = "2. Import CSV file. \n".freeze
  MENU_OPTION_3 = "3. Export LaTeX code. \n".freeze
  MENU_OPTION_4 = "4. Exit. \n".freeze
  SEPARATOR = ('-' * 20).freeze
  INVALID_OPTION = "The option introduced is not valid\n".freeze
  EXIT_OPTION = 'Exit option selected.'.freeze
  GOODBY = 'Bye!'.freeze
  FULL_MENU = (MENU_HEADER + MENU_OPTION_1 + MENU_OPTION_2 +
               MENU_OPTION_3 + MENU_OPTION_4 + SEPARATOR).freeze
  SELECT_ROWS = 'Enter the number of rows:'.freeze
  SELECT_COLUMNS = 'Enter te number of columns:'.freeze
  SELECT_FILENAME = 'Enter the filename to save the LaTeX table '.freeze
  # LaTeX constants
  FILE_EXTENSION = '.tex'.freeze
  TABLE_BEGIN = "\\begin{table}\n\\begin{center}\n\\begin{tabular}".freeze
  TABLE_FINAL = "\\end{tabular}\n\\caption{}\n\\label{}" \
                           "\n\\end{center}\n\\end{table}\n".freeze
  V_SEPARATOR = " \& ".freeze
  H_SEPARATOR = "\\hline\n".freeze
  TABLE_NEXT_ROW = (" \\\\\n" + H_SEPARATOR).freeze
  CENTER_START = '{|'.freeze
  CENTER_COLUMN = 'c|'.freeze
  CENTER_END = "}\n".freeze

  #File constants
  EXISTING_FILE = 'The selected file already exists. Please pick another one'.freeze
  SAVED_FILE = 'The file has been properly saved in: '
end
