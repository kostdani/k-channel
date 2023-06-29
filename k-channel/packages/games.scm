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
                       "09gd1zia27fa5phz0xx375y89rdsvf9pgfmw4n38pp108gh6002c"))))))
