# Lecture Notes Template

Template for creates a set of lecture notes


## Three versions of the notes

This template produces three sets of notes:

 1. Master copy (all black text) and sidenotes.
 2. Gapped notes (blank boxes).
 3. Gapped notes, with text filled in in blue.


## Running the notes

To create all three versions of the notes, just run:

 ```
 ./makeRmd.sh
 ```

## Content

 * The content `.Rmd` files are contained in the `chapters` folder.
 * Subsections which contain code are contained in the `Rcode` folder.

## Some features

 * Creates notes in PDF format.
 * Includes frameboxes for parts that will be gapped.
 * Can customise syntax colours (see `preamble.tex`).
 * Can include `tikz` figures.
 * Can increase the space in the frameboxes.



## Output

The `makeRmd.R` script is able to create three sets of notes by using the separate configuration
files:

 * `_bookdown.yml`
 * `_bookdown_gap.yml`
 * `_bookdown_gapfilled.yml`

These will lead to three separate PDFs being created in the `output_notes` directory.


## Customing the options

To see how to change the options, look at the file `makeRmd.R` which does the heavy lifting in R.
For example, you may not want to compile all three sets every time. I played around with passing
a parameter to `makeRmd.sh`, but in the end it is easier to just comment out the appropriate lines
in `makeRmd.R`.

### Output options

There are the following parameters in a list in each `bookdown::render_book` call.
For example, the 'master copy' for the lecturer has the following parameter list:

```
params = list(showtextparam = 'true',
              useframe = 'true', 
              gaptextisblue = 'false',
              showsidenotes = 'true',
              moreboxspace = 'false', 
              vhval = '0.9')
```

  * `showtextparam` controls whether or not the text in the frame boxes is
    displayed or not (these are the gaps, when this is set to `false`).
  * `useframe` controls whether or not the gaps are surrounded by a frame box.
  * `gaptextisblue` - as the name suggests, if `true` then the text in the frame
    boxes is in blue (this is used for the student version, but not the lecturer's 
    version).
  * `showsidenotes` controls whether notes in the margin (to remind the lecturer)
    to emphasise/say certain points are displayed or not.
  * `moreboxspace` controls whether or not the gapped frameboxes are wider than usual.
    At the moment this is always set to `false`, but if we wished to make the boxes
    wider to give the students more space to fill in the box with their handwriting, 
    this could be set to true.
  * `vhval`, abbreviations for *vertical height value*, this is tied to `moreboxspace`
    when that flag is `true`. Sets the amount of additional vertical space in the framebox.
    A value of `0.9` is actually quite large, and perhaps a value of `0.2` would even be 
    enough, but this default value will at least make it obvious what this parameter is
    doing. Note: this value is used in the command `\vspace{0.9cm}`.


It would be possible to not hardcode the options, and predefine the lists, but this
would involve setting the flag `clean_envir=F`, which I would prefer not to do.


### Printing code chunks

Note that grey code box is not printed; not sure how to resolve this.


### Ignoring `_bookdown_files` directory

The `.gitignore` file ignores the `_bookdown_files` directory, because there are many files in it,
and only these base files are needed to create the PDFs.


### Dependencies

At a minimum, the following need to be installed:
  
  * R programming language
  * `pandoc`
  * `rmarkdown` package for R
  * `bookdown` package for R


To make the example work, the following R packages need to be installed:

```
xtable
rmarkdown
bookdown
grid
gridExtra
tikzDevice)
ggplot2
```


## Credits

Special thanks to Din-Houn Lau for inspiration, sharing his LaTeX/Sweave solution which produces a set of three notes (as this approach does), and for sharing his LaTeX approach using booleans and `\vphantom` for creating/filling in the gaps.

For the R Markdown side of thiongs, I had a lot of help from loads of examples on the internet (especially on Stackoverflow); there are some commented links in the raw files to particularly helpful posts.. I was also inspired by the [Rcpp-FAQ Vignette](https://cran.r-project.org/web/packages/Rcpp/vignettes/Rcpp-FAQ.pdf), although I ended up using a different output format.


