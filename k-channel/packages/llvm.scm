(define-module (k-channel packages llvm)
  #:use-module (guix)
  #:use-module ((guix licenses) #:prefix license:)
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

(define %llvm-monorepo-hashes
  '(("14.0.6" . "14f8nlvnmdkp9a9a79wv67jbmafvabczhah8rwnqrgd5g3hfxxxx")
    ("15.0.7" . "12sggw15sxq1krh1mfk3c1f07h895jlxbcifpwk3pznh4m1rjfy2")
    ("16.0.6" . "0jxmapg7shwkl88m4mqgfjv4ziqdmnppxhjz6vz51ycp2x4nmjky")
    ("17.0.6" . "1a7rq3rgw5vxm8y39fyzr4kv7w97lli4a0c1qrkchwk8p0n07hgh")
    ("18.1.8" . "1l9wm0g9jrpdf309kxjx7xrzf13h81kz8bbp0md14nrz38qll9la")
    ("19.1.7" . "18hkfhsm88bh3vnj21q7f118vrcnf7z6q1ylnwbknyb3yvk0343i")
    ("20.1.8" . "0v0lwf58i96vcwsql3hlgy72z3ncfvqwgyghyn26m2ri8vy83k6a")
    ("21.1.1" . "01xf0yl9xf1f29v2afyzs0rl4sqa7n7wd5bdv4qgih8cnbfmj7r0")))

(define %llvm-patches
  '(("14.0.6" . ("clang-14.0-libc-search-path.patch"
                 "clang-runtime-14-glibc-2.36-compat.patch"
                 "clang-14-remove-crypt-interceptors.patch"))
    ("15.0.7" . ("clang-15.0-libc-search-path.patch"
                 "clang-16-remove-crypt-interceptors.patch"))
    ("16.0.6" . ("clang-16.0-libc-search-path.patch"
                 "clang-16-remove-crypt-interceptors.patch"))
    ("17.0.6" . ("clang-17.0-libc-search-path.patch"
                 "clang-17.0-link-dsymutil-latomic.patch"))
    ("18.1.8" . ("clang-18.0-libc-search-path.patch"
                 "clang-17.0-link-dsymutil-latomic.patch"))
    ("19.1.7" . ("clang-18.0-libc-search-path.patch"
                 "clang-17.0-link-dsymutil-latomic.patch"))
    ("20.1.8" . ("clang-18.0-libc-search-path.patch"
                 "clang-17.0-link-dsymutil-latomic.patch"))
    ("21.1.1" . ("clang-18.0-libc-search-path.patch"
                 "clang-17.0-link-dsymutil-latomic.patch"))))

(define (llvm-monorepo version)
  (origin
    (method git-fetch)
    (uri (git-reference
          (url "https://github.com/llvm/llvm-project")
          (commit (string-append "llvmorg-" version))))
    (file-name (git-file-name "llvm-project" version))
    (sha256 (base32 (assoc-ref %llvm-monorepo-hashes version)))
    (patches (map search-patch (assoc-ref %llvm-patches version)))))

(define* (mlir-from-llvm llvm)
  (package
    (name "mlir")
    (version (package-version llvm))
    (source (llvm-monorepo (package-version llvm)))
    (build-system cmake-build-system)
    (native-inputs (package-native-inputs llvm))
    (inputs (list llvm))
    (arguments
     `(#:build-type "Release"
       #:configure-flags '("-DLLVM_ENABLE_PROJECTS=mlir"
                           "-DLLVM_TARGETS_TO_BUILD=X86"
                           "-DLLVM_BUILD_EXAMPLES=ON"
                           "-DLLVM_BUILD_UTILS=ON"
                           "-DLLVM_INSTALL_TOOLCHAIN_ONLY=OFF")
       #:tests? #f ;Tests require gtest
                    #:phases #~(modify-phases %standard-phases
                        (add-after 'unpack 'change-directory
                          (lambda _
                            (chdir "mlir"))))
       #:modules ((srfi srfi-1)
                  (ice-9 match)
                  ,@%cmake-build-system-modules)))
    (home-page "https://mlir.llvm.org/")
    (synopsis "Multi-Level Intermediate Representation library")
    (description "Novel approach to building reusable and extensible compiler
infrastructure. MLIR aims to address software fragmentation, improve compilation
for heterogeneous hardware, significantly reduce the cost of building domain
specific compilers, and aid in connecting existing compilers together.")
    (license (package-license llvm))))

(define-public mlir-21
  (mlir-from-llvm llvm-21)) 
