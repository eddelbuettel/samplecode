#!/bin/bash

## this is just an example in which we simply output
## data to stdout -- which is 'fixed'.
##
## a real script would potentially do some work, maybe 
## work with command-line arguments etc pp -- but our
## focus here is on the R side of things
##
## also worth reiterating that this could be a Perl,
## Python, Ruby, Node/JS, ... "whatever" script. The 
## only thing that matter is that we should be able to
## invoke it on each platform, which may be easiest for
## shell.  So this is shell.

cat <<EOF 
date,foo,bar
2001-01-01,10,12
2001-02-01,9,13
2001-03-01,11,12
2001-04-01,12,14
2001-05-01,13,15
2001-06-01,14,17
EOF
