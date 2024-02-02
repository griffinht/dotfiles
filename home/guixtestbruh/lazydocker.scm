(use-modules
  (guix packages))

(package
  (name "lazydocker")
  (version "0.23.1")
  (source (local-file "lazydocker_0.23.1_Linux_x86_64.tar.gz"))
  (build-system copy-build-system)
  (synopsis "A simple terminal UI for docker, written in Go")
  (description "")
  (license mit)
  (home-page "https://github.com/jesseduffield/lazydocker/"))
