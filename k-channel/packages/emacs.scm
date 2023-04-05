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
    (version "0.9.7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/zerolfx/copilot.el")
             (commit "f1e76834990bc94c2f157f7147648b15c2f12ecd")
	     ))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0mi64a6pnblfqx278isbx487xhijs1q1cgjpswsvmi7qza2v8viq"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list emacs-dash emacs-editorconfig emacs-s node-lts))
    (home-page "https://github.com/zerolfx/copilot.el")
    (synopsis "copilot.el")
    (description
     "Copilot.el is an Emacs plugin for GitHub Copilot.")
    (license license:gpl3+)))
