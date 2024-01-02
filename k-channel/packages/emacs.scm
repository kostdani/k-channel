(define-module (k-channel packages emacs)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix build-system emacs)
  #:use-module (guix utils)
  #:use-module (gnu packages emacs)
  #:use-module (gnu packages emacs-xyz)
  #:use-module (gnu packages node))


(define-public emacs-copilot
  (package
    (name "emacs-copilot")
    (version "0.10.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/zerolfx/copilot.el")
             (commit "653fe7b12990b5b7a050971bed4579022ce4b4f8")
	     ))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1cy3541l33ri4qai61f3l4179q43np9flh5ank5l5a35a1c19gad"))))
    (build-system emacs-build-system)
    (arguments
       `(#:include (cons "^dist\\/" %default-include)))
    (propagated-inputs
     (list emacs-dash emacs-editorconfig emacs-s node-lts))
    (home-page "https://github.com/zerolfx/copilot.el")
    (synopsis "copilot.el")
    (description
     "Copilot.el is an Emacs plugin for GitHub Copilot.")
    (license license:gpl3+)))


  (define-public emacs-exwm-xwidgets
    (package
     (inherit ((package-input-rewriting `((,emacs . ,emacs-xwidgets))) emacs-exwm))
     (name "emacs-exwm-xwidgets")
     (synopsis "Emacs X window manager (with Xwidgets)")))
