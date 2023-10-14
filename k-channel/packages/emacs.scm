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
    (version "0.10.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/zerolfx/copilot.el")
             (commit "3086d214f40a9689d00d647667b73795abc07bc9")
	     ))
       (file-name (git-file-name name version))
       (sha256
        (base32 "09ay9h9pailaaj6z57v7nla2k8nn660d92wa7hgbaw8v4mq7mx0n"))))
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
     ((package-input-rewriting `((,emacs . ,emacs-xwidgets)))
      emacs-exwm))
