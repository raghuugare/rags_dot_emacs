(require 'package)

;; prevent automatically loading all packages at start-up...
(setq package-enable-at-startup nil)

;; set-up package repos
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("elpa" . "http://elpa.gnu.org/packages/"))

(package-initialize)

;; Now & then, I like to tweak the Font Family of the group 'basic-faces'(M-x customize RET basic-faces RET).
;; Some of my favourite fonts are:
;; Ubuntu Mono, Inconsolata, Monaco, Consolas, & Menlo.
;; A new font I'm loving is the 'Input' mono-spaced font.
;; The following setting assumes you have the Input Mono Font installed.
;; Source: http://input.fontbureau.com/download/
;; Thanks to David Jonathan Ross for making this font freely available.
;; NOTE: This font is free for Personal use only.
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "White" :foreground "Black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 130 :width normal :foundry "nil" :family "Input Mono Narrow")))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(menu-bar-mode nil "Control visibility of Graphical Menu-bar")
 '(show-paren-mode t "Set/unset Show matching parentheses")
 '(tool-bar-mode nil "Control visibility of Graphical Tool bar"))

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
  :ensure t
  :pin melpa-stable)
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
  :init (setq markdown-command "pandoc -c github-pandoc.css --from=markdown --to=html5 --mathjax --highlight-style=pygments --standalone"))
;; A sample command to generate HTML from a README.md file using pandoc is as follows:
;; pandoc -c <path>/github-pandoc.css --from=markdown --to=html5 --mathjax --highlight-style=pygments --standalone README.md --output=README.html
;; NOTE: If we install the 'markdown' parser first (brew install markdown), then, we have extra input formats supported in pandoc itself
;; E.g., pandoc --from can then have options like markdown_github which prevents the need for all the CSS hackery!

;; Get the AucTeX package for TeX-nical (& LaTeX) support.
(use-package tex-site
  :ensure auctex)

;; get the awesome string manipulation library by Magnar Sveen
;; Source: https://github.com/magnars/s.el
(use-package s
  :ensure t
  :pin melpa-stable)

;; get the excellent 'smex' library built on top of IDO mode.
;; Source: https://github.com/nonsequitur/smex
(use-package smex
  :ensure t
  :pin melpa-stable
  ;; Bind "M-x" to smex! :)
  ;; We can even set a different prompt by setting 'smex-prompt-string
  ;; The default prompt string is, of-course "M-x "
  :bind (("M-x" . smex)
	 ;; Bind the old "M-x" command to the chord "C-c C-c M-x"
	 ("C-c C-c M-x" . execute-extended-command))
  :config (smex-initialize))


