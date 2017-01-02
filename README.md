# LaTeX table creator

Simple LaTeX table code creator from user input.

##ToDo

* ~~Create Menu class to handle user input (instead of init.rb). ~~
* Accept CSV file as an input for the table.
* Tests (and Travis CI configuration).
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
