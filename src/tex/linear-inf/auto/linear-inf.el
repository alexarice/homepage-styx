(TeX-add-style-hook
 "linear-inf"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("lipics-v2019" "a4paper" "UKenglish" "cleveref")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("todonotes" "obeyDraft")))
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "href")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "latex2e"
    "lin-inf-macros"
    "webmacros"
    "lipics-v2019"
    "lipics-v201910"
    "todonotes"
    "ebproof"
    "cmll"
    "nicefrac"
    "hyperref")
   (LaTeX-add-labels
    "sec:introduction"
    "eq:php32-derived-inf"
    "eq:counterexample-inference"
    "sec:preliminaries"
    "eq:un-eq-rel"
    "prop:unit-free"
    "acu-and-logical-equivalence"
    "eq:switch"
    "eq:medial"
    "ex:mix"
    "example-weakening-duality"
    "thm:main"
    "sec:trivial"
    "trivial-composition"
    "thm:main-reduced"
    "prop:trivial"
    "prop:const-free-neg-free"
    "cor:main-red-to-main"
    "non-triv-const-free-neg-free-derivability-without-units"
    "lem:minimality"
    "sec:8var-inf"
    "sec:prev-lin-infs"
    "eq:10varinf-nonminimal"
    "sec:two-found-inferences"
    "sec:php32-refined"
    "eq:php32-derived-inf-repeated"
    "duality-of-php32-8var"
    "sec:counterexample-inference"
    "eq:counterexample-inference-repeated"
    "definition-of-lccs"
    "sec:webs"
    "ex:relation-web"
    "lem:rw-inference"
    "lem:rw-trivial"
    "rem:using-webs"
    "prop:medial-char"
    "sec:algorithm"
    "sec:library"
    "sec:search"
    "def:num-rep"
    "lem:least"
    "sec:conclusions"
    "sect:app:further-proofs-examples"
    "sect:reduction-10var-to-8var"
    "sec:app:validity-php32-derived"
    "sec:app:validity-counterexample-inference"
    "sec:ind-min-php32"
    "sec:ind-min-counterexample-inference")
   (LaTeX-add-bibliographies
    "citations"))
 :latex)

