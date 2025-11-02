(define-module (k-channel packages llvm)
  #:use-module (guix)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix git-download)
  #:use-module (guix licenses)
  #:use-module (gnu packages)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages mpi)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages algebra)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages gdb)
  #:use-module (gnu packages maths)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages python)
  #:use-module (gnu packages llvm)
  #:use-module (gnu packages check)
  #:use-module (srfi srfi-1)
  #:use-module (ice-9 match))

(define-public mlir-21
  (package
    (name "mlir")
    (version (package-version llvm-19))
    (source (llvm-monorepo version))
    (build-system cmake-build-system)
    (inputs
     (list llvm-21))
    (arguments
     (list #:build-type "Release"
           #:configure-flags
           #~(list "-DMLIR_BUILD_MLIR_C_DYLIB=ON"
                   "-DLLVM_BUILD_LLVM_DYLIB=ON"
                   "-DLLVM_LINK_LLVM_DYLIB=ON")
           #:tests? #f                  ; Tests require gtest
           #:phases #~(modify-phases %standard-phases
                        (add-after 'unpack 'change-directory
                          (lambda _
                            (chdir "mlir"))))))
    (home-page "https://mlir.llvm.org/")
    (synopsis "Multi-Level Intermediate Representation")
    (description "This package is a novel approach to building reusable
and extensible compiler infrastructure.  MLIR aims to address software
fragmentation, improve compilation for heterogeneous hardware, significantly
reduce the cost of building domain specific compilers, and aid in connecting
existing compilers together.")
    (license license:asl2.0))) ; With LLVM exception
