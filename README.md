LaTeX format for PhD thesis in Physics at the Tata Institute of Fundamental Research (TIFR), Mumbai.
This is based on the LaTeX "book" class. The document format used here are in 
accordance to the specifications mentioned on the website of 
Subject Board of Physics, TIFR and formats presented on Datanet2.0. 
The main file that is compiled is `thesis.tex`.


## Directory structure 
This format is stored in a [public repository](https://github.com/samarth-kashyap/tifr-thesis).
All the other files are organized under the main directory under the following
directory names
1. `tifr-thesis/preamble`: contains the title page and all the other mandatory 
   pages before the table-of-contents (TOC)
2. `tifr-thesis/chapters`: Each chapter needs to be placed in a separate .tex file
   inside this folder.
3. `tifr-thesis/figures`: all the figures are to be placed here
4. `tifr-thesis/appendix`: all the .tex files corresponding to appendices are
   to be placed here

Further instructions for modifying the thesis are provided 
as comments in `thesis.tex` file.

## Compilation and PDF generation
The package comes with 3 bash scripts which help in compilation and
cleaning up of auxilliary files. ```compilepdf.sh, cleanlatex.sh, ccc.sh```.
To compile the document and generate PDF file, use the command
```
sh compilepdf.sh
```

To clean the auxilliary LaTeX files generated during compilation, use the command
```
sh cleanlatex.sh
```
Ensure that there are no errors when you run the `sh compilepdf.sh`. Once 
you are confident about the non-existence of errors, you can run the 
clean-compile-clean cycle.
```
sh ccc.sh
```

**Note**: This suppresses all output. Hence, presence of errors will stop the compilation
without prompting for user input. It's important, therefore to use ```ccc.sh``` only
in the final stages of your manuscript preparation.


## Generation of ink-signature for declaration
Dependencies: [potrace](http://potrace.sourceforge.net) and ghostscript.
The declaration page requires the signature of the candidate and the thesis
advisor. Here's a procedure to generate a digital version of ink-signature 
on paper.

1. Sign on a blank piece of paper; Click picture of it on phone camera
   and crop appropriately so that only the signature remains. This is 
	 usually in the `.jpg` format.

2. The .jpg image has colors of the paper as well. Converting the image to eps
   is a vectorizing process, where all the extraneous details are eliminated
	 and the image has a white background with signature in black.

```
convert sign.jpg -type truecolor sign.bmp
potrace sign.bmp
gs -dSAFER -dBATCH -dNOPAUSE -dEPSCrop -r600 -sDEVICE=pngalpha -sOutputFile=sign.png sign.eps
ps2pdf -dEPSCrop -dCompressPages=false sign.eps sign.pdf
```

This creates a `.png` image. Place the `sign.png` file in `tifr-thesis/figures` and 
the declaration should be able to read the file from there.
