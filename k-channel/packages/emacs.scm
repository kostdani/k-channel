(define-module (k-channel packages emacs)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix build-system emacs)
  #:use-module (gnu packages emacs-xyz)
  #:use-module (gnu packages node))

(define-public emacs-copilot
  (package
    (name "emacs-copilot")
    (version "1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/zerolfx/copilot.el")
             (commit "b8ffab08d2eeaae3edff270800c59b3db53047d4")
	     ))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1r2hxmbkdf6pxvj6piwdiz4f9amlkrk64846klvy4ri3xgxnp33y"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list emacs-dash emacs-editorconfig emacs-s node))
    (home-page "https://github.com/zerolfx/copilot.el")
    (synopsis "copilot.el")
    (description
     "Copilot.el is an Emacs plugin for GitHub Copilot.")
    (license license:gpl3+)))
