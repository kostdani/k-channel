(define-module (k-channel packages llama)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix build-system gnu))

(define-public llama-cpp
  (package
    (name "llama-cpp")
    (version "master-cc9cee8")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/ggerganov/llama.cpp")
                    (commit version)))
              (sha256
               (base32
                "17gz15fb26qy5wzd49mmiywan0ch50f7bmh2w13cap9c1rxy9744"))
              (file-name (git-file-name name version))))
    (build-system gnu-build-system)
    (synopsis "LLaMa.cpp")
    (description "Inference of LLaMA model in pure C/C++")
    (home-page "https://github.com/ggerganov/llama.cpp")
    (license license:expat)))
