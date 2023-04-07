(define-module (k-channel packages llama)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix build-system gnu))

(define-public llama-cpp
  (package
    (name "llama.cpp")
    (version "master-cc9cee8")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ggerganov/llama.cpp")
                    (commit version)))
              (sha256
               (base32
                "0nf66gswwz33cz58awyqwsaqpnnj371m2cw09ajv5f87b95mr2g1"))
              (file-name (git-file-name name version))))
    (build-system gnu-build-system)
    (synopsis "LLaMa.cpp")
    (description "Inference of LLaMA model in pure C/C++")
    (home-page "https://github.com/ggerganov/llama.cpp")
    (license license:expat)))
