(define-module (k-channel packages gnome)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix build-system gnu))

(define-public gnome-shell-extension-material-shell
  (package
    (name "gnome-shell-extension-material-shell")
    (version "42")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/material-shell/material-shell")
                    (commit version)))
              (sha256
               (base32
                "103pl77dhafi2ayds5yma2smv3b58zcysnd6vl5m5zavjvk35sz7"))
              (file-name (git-file-name name version))))
    (build-system gnu-build-system)
    (synopsis "Material Shell gnome extension")
    (description "A modern desktop interface for Linux extending GNOME Shell.
                 Providing a unique, simple, productivity-oriented, 
                 innovative and automated mouse and keyboard workflow 
                 which aims to be faster and easier to use and creates 
                 a great user experience.")
    (home-page "https://github.com/material-shell/material-shell")
    (license license:gpl3+)))
