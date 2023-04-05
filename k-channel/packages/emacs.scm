(define-module (channel-x packages emacs)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix build-system emacs)
  #:use-module (gnu packages emacs-xyz))

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
        (base32 "1vf5zm82sx3m1yvq73km8ajapv6rnz41b1jrsif7kh0ijh9vk3qi"))))
    (build-system emacs-build-system)
    (propagated-inputs
     (list emacs-dash emacs-editorconfig emacs-s))
    (home-page "https://github.com/zerolfx/copilot.el")
    (synopsis "copilot.el")
    (description
     "Copilot.el is an Emacs plugin for GitHub Copilot.")
    (license license:gpl3+)))
