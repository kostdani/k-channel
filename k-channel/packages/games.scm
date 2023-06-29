(define-module (k-channel packages games)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (gnu packages game-development))

(define-public tes3mp 
               (package 
                (inherit openmw)
                (name "tes3mp")
                (version "0.8.1")
                (source
                 (origin  
                 (method git-fetch)
                 (uri (git-reference
                        (url "https://github.com/TES3MP/TES3MP")
                        (commit version)))
                 (file-name (git-file-name name version))
                 (sha256
                    (base32
                       "19mcbnjl4279qalb97msf965bjax48mx1r1qczyvwhn28h6n3bsy"))))))
