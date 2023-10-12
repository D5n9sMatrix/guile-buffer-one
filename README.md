<!DOCTYPE html>
<!-- saved from url=(0075)https://www.gnu.org/software/emacs/manual/html_node/elisp/Integer-Type.html -->
<html><!-- Created by GNU Texinfo 7.0.3, https://www.gnu.org/software/texinfo/ --><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Integer Type (GNU Emacs Lisp Reference Manual)</title>

<meta name="description" content="Integer Type (GNU Emacs Lisp Reference Manual)">
<meta name="keywords" content="Integer Type (GNU Emacs Lisp Reference Manual)">
<meta name="resource-type" content="document">
<meta name="distribution" content="global">
<meta name="Generator" content="makeinfo">
<meta name="viewport" content="width=device-width,initial-scale=1">

<link rev="made" href="mailto:bug-gnu-emacs@gnu.org">
<link rel="icon" type="image/png" href="https://www.gnu.org/graphics/gnu-head-mini.png">
<meta name="ICBM" content="42.256233,-71.006581">
<meta name="DC.title" content="gnu.org">
<style type="text/css">
@import url('/software/emacs/manual.css');
</style>
</head>

<body lang="en">
<div class="subsection-level-extent" id="Integer-Type">
<div class="nav-panel">
<p>
Next: <a href="https://www.gnu.org/software/emacs/manual/html_node/elisp/Floating_002dPoint-Type.html" accesskey="n" rel="next">Floating-Point Type</a>, Up: <a href="https://www.gnu.org/software/emacs/manual/html_node/elisp/Programming-Types.html" accesskey="u" rel="up">Programming Types</a> &nbsp; [<a href="https://www.gnu.org/software/emacs/manual/html_node/elisp/index.html#SEC_Contents" title="Table of contents" rel="contents">Contents</a>][<a href="https://www.gnu.org/software/emacs/manual/html_node/elisp/Index.html" title="Index" rel="index">Index</a>]</p>
</div>
<hr>
<h4 class="subsection" id="Integer-Type-1">2.4.1 Integer Type</h4>

<p>Under the hood, there are two kinds of integers—small integers,
called <em class="dfn">fixnums</em>, and large integers, called <em class="dfn">bignums</em>.
</p>
<p>The range of values for a fixnum depends on the machine.  The
minimum range is −536,870,912 to 536,870,911 (30 bits; i.e.,
−2**29
to
2**29 − 1)
but many machines provide a wider range.
</p>
<p>Bignums can have arbitrary precision.  Operations that overflow a
fixnum will return a bignum instead.
</p>
<p>All numbers can be compared with <code class="code">eql</code> or <code class="code">=</code>; fixnums can
also be compared with <code class="code">eq</code>.  To test whether an integer is a fixnum or a
bignum, you can compare it to <code class="code">most-negative-fixnum</code> and
<code class="code">most-positive-fixnum</code>, or you can use the convenience predicates
<code class="code">fixnump</code> and <code class="code">bignump</code> on any object.
</p>
<p>The read syntax for integers is a sequence of (base ten) digits with an
optional sign at the beginning and an optional period at the end.  The
printed representation produced by the Lisp interpreter never has a
leading ‘<samp class="samp">+</samp>’ or a final ‘<samp class="samp">.</samp>’.
</p>
<div class="example">
<div class="group"><pre class="example-preformatted">-1               ; <span class="r">The integer −1.</span>
1                ; <span class="r">The integer 1.</span>
1.               ; <span class="r">Also the integer 1.</span>
+1               ; <span class="r">Also the integer 1.</span>
</pre></div></div>


<p>See <a class="xref" href="https://www.gnu.org/software/emacs/manual/html_node/elisp/Numbers.html">Numbers</a>, for more information.
</p>
</div>





</body></html>