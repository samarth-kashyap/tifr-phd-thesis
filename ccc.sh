echo "Running the clean-compile-clean cycle:"
echo "1. Cleaning old LaTeX auxillary files ... DONE"
sh cleanlatex.sh &> .clean.log
echo "2. Compiling LaTeX and generating PDF ..."
sh compilepdf.sh &> .pdflatex-op.log
tail -2 .pdflatex-op.log
echo "2.  .. Compilation DONE"
sh cleanlatex.sh &> .clean.log
echo "3. Cleaning LaTeX auxillary files ... DONE"
rm .clean.log
rm .pdflatex-op.log
echo "4. Opening PDF ..."
okular thesis.pdf
