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

All tools use [SXML][] revision 3.0.

Dependencies
------------

* binaries: none
* source code
  + [Chicken Scheme][] > version 4.0
  + the [ssax][], [sxpath][], and [sxml-transforms][] modules


[SXML]: http://okmij.org/ftp/Scheme/SXML.html
[Chicken Scheme]: http://www.call-cc.org/
[ssax]: http://wiki.call-cc.org/eggref/4/ssax
[sxpath]: http://wiki.call-cc.org/eggref/4/sxpath
[sxml-transforms]: http://wiki.call-cc.org/eggref/4/sxml-transforms
