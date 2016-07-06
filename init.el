(require 'package)

;; prevent automatically loading all packages at start-up...
(setq package-enable-at-startup nil)

;; set-up package repos
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("elpa" . "http://elpa.gnu.org/packages/"))

(package-initialize)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(menu-bar-mode nil)
 '(tool-bar-mode nil))


;; First, ensure that we have the awesome use-package installed!
;; Hat-tip to John Wiegley (@jwiegley) ! <3 :)
;; Source: https://github.com/jwiegley/use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(require 'diminish)
(require 'bind-key)

;; get magit for working with Git
;; also bind its popular chord "C-x g" to magit-status pop-up!
(use-package magit
  :ensure t
  :pin melpa-stable
  :bind ("C-x g" . magit-status))

;; Properly set exec-path from the shell
;; package courtesy Steve Purcell (@purcell)
;; Source: https://github.com/purcell/exec-path-from-shell
(use-package exec-path-from-shell
  :ensure t)
;; init the package...
(exec-path-from-shell-initialize)


;; get markdown-mode for working with .md files.
(use-package markdown-mode
  :ensure t
  :pin melpa-stable
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "pandoc -c github-pandoc.css --from markdown -t html5 --mathjax --highlight-style pygments --standalone"))
;; A sample command to generate HTML from a README.md file using pandoc is as follows:
;; pandoc -c <path>/github-pandoc.css --from=markdown --to=html5 --mathjax --highlight-style=pygments --standalone README.md --output=README.html
