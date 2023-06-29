(define-module (k-channel packages games)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix build-system cmake)
  #:use-module (gnu packages game-development))



(define-public raknet
  (package
   (name "raknet")
   (version "1a16989")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
	   (url "https://github.com/facebookarchive/RakNet")
	   (commit version)))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0qmzdqj2ccc9vkn67i2f6s6sznhz213pk8vkp50mvg23wxw8xrzp"))))
   (build-system cmake-build-system)
   (synopsis "RakNet is a cross platform, open source, C++ networking engine for game programmers.")
   (description "RakNet is a cross platform, open source, C++ networking engine for game programmers.")
   (home-page "https://github.com/facebookarchive/RakNet")
   (license license:bsd-3)))


 (define-public tes3mp 
   (package 
    (inherit openmw)
    (name "tes3mp")
    (version "0.8.1")
    (inputs (list raknet))
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

