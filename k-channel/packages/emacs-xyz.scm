(define-module (k-channel packages emacs-xyz)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix build-system emacs)
  #:use-module (gnu packages emacs)
  #:use-module (gnu packages emacs-xyz)
  #:use-module (gnu packages emacs-build)
  #:use-module (gnu packages node)
  #:use-module (guix gexp))

(define-public emacs-copilot
  (package
    (name "emacs-copilot")
    (version "v0.5.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/copilot-emacs/copilot.el")
             (commit version)))
       (sha256
        (base32
         "1xvhfwgddms0cxhi9pn75vb6qsd6gqfv8s59xjk9ilh57nvwzqfn"))
       (file-name (git-file-name name version))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list emacs-editorconfig
           emacs-jsonrpc
           emacs-compat
           emacs-track-changes
           node))
    (home-page "https://github.com/copilot-emacs/copilot.el")
    (synopsis "GitHub Copilot plugin for Emacs")
    (description
     "This package provides an Emacs frontend for GitHub Copilot,
allowing AI-assisted code completion inside Emacs.")
    (license license:expat)))
