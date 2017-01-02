# LaTeX table creator

Simple LaTeX table code creator from user input.

[![Build Status](https://travis-ci.org/febouge/latex-table-creator.svg?branch=master)](https://travis-ci.org/febouge/latex-table-creator)

## Usage

Clone the code and run:

```
./latex_table_creator
```
or
```
ruby latex_table_creator
```
##ToDo

* ~~Create Menu class to handle user input (instead of init.rb).~~
* Accept CSV file as an input for the table.
* Tests (and Travis CI configuration) with Rake.
* ~~Check another structure for the project.~~

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
