(TeX-add-style-hook "pkgEvignette"
 (lambda ()
    (TeX-add-symbols
     '("code" 1)
     '("pkg" 1)
     '("proglang" 1)
     "R"
     "Rns")
    (TeX-run-style-hooks
     "mathpazo"
     "palatino"
     "pslatex"
     ""
     "fontenc"
     "T1"
     "geometry"
     "paper=letterpaper"
     "margin=1in"
     "latex2e"
     "art11"
     "article"
     "11pt")))

