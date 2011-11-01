xml2sexp: tools for converting between XML files and s-expressions
==================================================================

Eric Nichols, Tohoku University <eric@ecei.tohoku.ac.jp>

Tools
-----

Binaries are in bin/, source code is in scheme/

* xml2sexp: converts cabocha XML to s-expressions, unpacking the Mecab
  part-of-speech features into labeled attributes

S-expression Format
-------------------

All tools use [SXML revision 3.0][http://okmij.org/ftp/Scheme/SXML.html]

Dependencies
------------

* binaries: none
* source code
  + [Chicken Scheme][http://www.call-cc.org/] > version 4.0
  + the ssax, sxpath, and sxml-transforms modules
