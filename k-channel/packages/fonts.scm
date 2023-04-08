(define-module (k-channel packages fonts)
  #:use-module ((gnu packages autotools) #:select (autoconf automake))
  #:use-module ((gnu packages tex) #:select (texlive-bin))
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build-system font)
  #:use-module ((guix build-system gnu) #:select (gnu-build-system)))

(define-public font-nerd-fonts
  (package
    (name "font-nerd-fonts")
    (version "2.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/ryanoasis/nerd-fonts")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "09i467hyskvzj2wn5sj6shvc9pb0a0rx5iknjkkkbg1ng3bla7nm"))))
    (build-system font-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-before 'install 'make-files-writable
           (lambda _
             (for-each
              make-file-writable
              (find-files "." ".*\\.(otf|otc|ttf|ttc)$"))
             #t)))))
    (home-page "https://www.nerdfonts.com/")
    (synopsis "Iconic font aggregator, collection, and patcher")
    (description
     "Nerd Fonts patches developer targeted fonts with a high number
of glyphs (icons). Specifically to add a high number of extra glyphs
from popular ‘iconic fonts’ such as Font Awesome, Devicons, Octicons,
and others.")
    (license license:expat)))
