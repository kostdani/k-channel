(define-module (k-channel packages games)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix build-system cmake)
  #:use-module (gnu packages game-development)
  #:use-module (guix gexp))



(define-public raknet
  (package
   (name "raknet")
   (version "4.3.4")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
	   (url "https://github.com/miniclip/RakNet")
	   (commit version)))
     (file-name (git-file-name name version))
     (sha256
      (base32
       "0x3vfr1hxs9smf7ck56zw1n8i0m63agv4ymjq160ph45qcfpvq31"))))
   (build-system cmake-build-system)
   (arguments
    (list
     #:phases
     #~(modify-phases %standard-phases
		      (delete 'check)
		      (add-after 'build 'move-files
				 (lambda _
				   ;;(rename-file "chat" "alpaca-chat")
				   (install-file "Lib/DLL/libRakNetDLL.so" (string-append (assoc-ref %outputs "out") "/lib")))))))
   (synopsis "RakNet is a cross platform, open source, C++ networking engine for game programmers.")
   (description "RakNet is a cross platform, open source, C++ networking engine for game programmers.")
   (home-page "https://github.com/miniclip/RakNet")
   (license license:bsd-3)))


 (define-public tes3mp 
   (package 
    (inherit openmw)
    (name "tes3mp")
    (version "0.8.1")
    (inputs (list raknet recastnavigation))
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

