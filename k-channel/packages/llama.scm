(define-module (k-channel packages llama)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module (guix build-system gnu))

(define-public alpaca-cpp
  (package
    (name "alpaca-cpp")
    (version "81bd894")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/antimatter15/alpaca.cpp")
                    (commit version)))
              (sha256
               (base32
                "0fai4wb6q2jn0fmjam98wm63rvfmyd1s8s669rqgilv8mgmqndwb"))
              (file-name (git-file-name name version))))
    (build-system gnu-build-system)
    (arguments
     (list
      #:make-flags #~(list "CC=gcc")
      #:phases
      #~(modify-phases %standard-phases
		      (delete 'bootstrap)
		      (delete 'configure)
		      (delete 'check)
		      (delete 'install)
		      
		      (add-after 'build 'move-files
				 (lambda _
				   (rename-file "chat" "alpaca-chat")
				   (install-file "alpaca-chat" (string-append (assoc-ref %outputs "out") "/bin")))))))
    (synopsis "Alpaca.cpp")
    (description "Run a fast ChatGPT-like model locally on your device")
    (home-page "https://github.com/antimatter15/alpaca.cpp")
    (license license:expat)))
