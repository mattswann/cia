# The Softer Side of the CIA #
### Solution Notes ###

![Spy vs spy](http://blogs.denverpost.com/opinion/files/2014/03/cia-senate-spying-cartoon-zyglis-495x399.jpg)

* The data set is not completely clean, so we sometimes run into problems. For example, the hash for Kosovo does not include a land use hash where we'd expect to find the arable land key. The solution runs but doesn't handle every possible impurity in the data.
* The arable land method makes use of Ruby's ternary-if. It's a sweet shortcut for a subset of if-statements. You can read about it [here](http://ruby-doc.org/core-2.2.0/doc/syntax/control_expressions_rdoc.html#label-Ternary+if).
* The expert method solution is really sloppy. Sorry! In particular, it's not DRY. It probably fails for some cases. And it should be wrapped in a loop. Refinements are left as an exercise for the eager Rubyist.