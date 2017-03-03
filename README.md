# LaTeX table creator

Simple LaTeX table code creator from user input.

[![Build Status - Travis CI](https://travis-ci.org/febouge/latex-table-creator.svg?branch=master)](https://travis-ci.org/febouge/latex-table-creator)

[![Build status - GitLab CI](https://gitlab.com/febouge/latex-table-creator/badges/master/build.svg)](https://gitlab.com/febouge/latex-table-creator/commits/master)
[![Coverage report](https://gitlab.com/febouge/latex-table-creator/badges/master/coverage.svg)](https://gitlab.com/febouge/latex-table-creator/commits/master)



## Usage

Clone the code and run:

```
./latex_table_creator
```
or
```
ruby latex_table_creator
```

## ToDo

* ~~Create Menu class to handle user input (instead of init.rb).~~
* ~~Accept CSV file as an input for the table.~~
* Tests ~~(and Travis CI configuration) with Rake.~~
* ~~Check another structure for the project.~~
* Fix the project in Codecov or change it to Coversall.

## Output file example
The output file generated with this little utility should be similar to the following code:

```latex
\begin{table}
\begin{center}
\begin{tabular}{|c|c|}
\hline
1 & 2 \\
\hline
2 & 3 \\
\hline
\end{tabular}
\caption{}
\label{}
\end{center}
\end{table}
```
