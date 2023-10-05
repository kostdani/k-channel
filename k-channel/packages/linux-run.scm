(define-module (k-channel packages linux-run)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system copy)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages gcc)
  #:use-module ((guix licenses) #:prefix license:))

(define-public linux-run
  (package
    (name "linux-run")
    (version "1.0.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://tildegit.org/solene/guix-linux-run")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0prh4i68xw6r8vkzz3g7njfgsj32i1viw17rbrhds25dr64zi070"))))
    (build-system copy-build-system)
    (arguments
     '(#:install-plan
       '(("linux-run" "bin/"))))
    (propagated-inputs
     `(("gtk+" ,gtk+)
       ("gcc-objc++:lib" ,gcc-objc++ "lib")))
    (home-page "https://tildegit.org/solene/guix-linux-run")
    (synopsis "Wrapper to run Linux binaries that are not from Guix")
    (description "This package provides a shell wrapper that will redefine
the environment to use Guix libraries for running a Linux binary.")
    (license license:bsd-2)))
