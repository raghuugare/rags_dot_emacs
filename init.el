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
 '(default ((t (:inherit nil :stipple nil :background nil :foreground nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 130 :width normal :foundry "nil" :family "Input Mono Narrow")))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(indent-tab-mode nil t)
 '(menu-bar-mode nil)
 '(package-selected-packages
	 (quote
		(abyss-theme alect-themes restclient paredit sass-mode wttrin jumblr yaml-mode json-mode web-mode use-package smex smartparens slime-volleyball slime sicp shakespeare-mode s pdf-tools markdown-mode magit lorem-ipsum git-gutter exec-path-from-shell color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized color-theme-modern chess)))
 '(pdf-tools-handle-upgrades nil)
 '(show-paren-mode t)
 '(tab-width 2)
 '(tool-bar-mode nil))

 ;; NOTE: Regarding Tabs vs Space issue
 ;; See the following art-icles!
 ;; https://www.emacswiki.org/emacs/TabsAreEvil
 ;; https://www.masteringemacs.org/article/converting-tabs-whitespace
 ;; https://www.emacswiki.org/emacs/IndentationBasics
 ;; https://www.emacswiki.org/emacs/SmartTabs
 ;; https://www.emacswiki.org/emacs/EightyColumnRule
 ;; https://www.jwz.org/doc/tabs-vs-spaces.html
 ;; http://xahlee.info/UnixResource_dir/writ/tabs_vs_spaces.html
 ;; https://github.com/jcsalomon/smarttabs


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

;; get web-mode for editing html & other(to be added later) web-templates in a powerful way.
;; Source: 
(use-package web-mode
  :ensure t
  :pin melpa-stable
  :mode (("\\.html\\'" . web-mode))
  :config
  (setq web-mode-markup-indent-offset 2))

;; get the lorem-ipsum package to insert standard Latin text 
(use-package lorem-ipsum
  :ensure t)

;; get the awesome smartparens package to manage pair-able stuff like (), [], HTML tags, etc.
;; Source: https://github.com/Fuco1/smartparens
;; Also see: https://ebzzry.github.io/emacs-pairs.html
(use-package smartparens
  :ensure t
  :pin melpa-stable
  :config
  (setq smartparens-global-mode t))

;; Package to support working with LISP.
;; Note: Also try 'Sly' which is a fork of this.
(use-package slime
	:ensure t
	:pin melpa-stable
	:config
	;; Use either sbcl or clisp as the LISP program...
	;; brew install sbcl RET
	;; brew install clisp RET
	;; (setq inferior-lisp-program "/usr/local/bin/slime")
	(setq inferior-lisp-program "/usr/local/bin/clisp")
	(setq slime-contribs '(slime-fancy)))

;; Package to support working with Scheme files.
(use-package geiser
	:ensure t
	:pin melpa-stable)

;; A Must-have mode for any serious LISP-y work!!
(use-package paredit
	:ensure t
	:pin melpa-stable)

;; Install a superb li'l REST-client from @pashky
;; Featured in EmacsRocks#15 (https://www.youtube.com/watch?v=fTvQTMOGJaw)
;; Source: https://github.com/pashky/restclient.el
(use-package restclient
	:ensure t)

;; =========================================================
;; ----------------- PDF Viewing on my Emacs ---------------
;; =========================================================
;; For the default experience, go with DocView (built-in)
;; For Mac, all that is needed is to install ghostscript
;; brew install ghostscript
;; And you're good to go!

;; For more options than the builtin DocView, we use "pdf-tools"
;; Source: https://github.com/politza/pdf-tools

;; PREREQUISITES (done!) :
;; brew install poppler RET 
;; brew install homebrew/emacs/pdf-tools RET
;; Now, we can install pdf-tools package from MELPA...

;;; Install epdfinfo via 'brew install pdf-tools' and then install the
;;; pdf-tools elisp via the use-package below.
;;; To upgrade the epdfinfo server, just do 'brew upgrade pdf-tools' prior to
;;; upgrading to newest pdf-tools package using Emacs package system.
(use-package pdf-tools
  :ensure t
  :config
  (custom-set-variables
    '(pdf-tools-handle-upgrades nil)) ; Use brew upgrade pdf-tools instead.
  (setq pdf-info-epdfinfo-program "/usr/local/bin/epdfinfo"))
;; init pdf-tools
(pdf-tools-install)

;; get gutter markers to see when Git-manages stuff changes!
;; source: https://github.com/syohex/emacs-git-gutter
(use-package git-gutter
	:ensure t
	:pin melpa-stable)

;; get haskell-mode for working with Haskell! :)
;; source: http://haskell.github.io/haskell-mode/
(use-package haskell-mode
	:ensure t
	:pin melpa-stable)

;; get a mode to help out with the Shakespearean templates(Hamlet, Lucius, Cassius, Julius)
;; source: http://github.com/CodyReichert/shakespeare-mode
(use-package shakespeare-mode
	:ensure t
	:pin melpa-stable)

;; get a mode for handling JSON files
(use-package json-mode
	:ensure t)

;; get a mode for handling YAML files
(use-package yaml-mode
	:ensure t)

;; get a mode for handling SASS files
(use-package sass-mode
	:ensure t
	:pin melpa-stable)

;; =========================================================
;; ------------------------THEMES---------------------------
;; =========================================================

;; get Solarized themes!
(use-package color-theme-sanityinc-solarized
	:ensure t)
;; get Tomorrow themese!
(use-package color-theme-sanityinc-tomorrow
	:ensure t)

;; get alect-themes!
;; source: https://github.com/alezost/alect-themes
(use-package alect-themes
	:ensure t)

;; get the abyss theme! :)
;; source: https://github.com/mgrbyte/emacs-abyss-theme
(use-package abyss-theme
	:ensure t)

;; get gutter markers to see when Git-manages stuff changes!
;; source: https://github.com/syohex/emacs-git-gutter
(use-package git-gutter
	:ensure t
	:pin melpa-stable)

;; ===========================================================
;; -----------------------GAMES-------------------------------
;; ===========================================================

;; get some awesome chess from the awesome Mr.John Wiegley! :-)
(use-package chess
	:ensure t)

;; for some word-play! :-)
(use-package jumblr
	:ensure t)

;; get slime-volleyball
(use-package slime-volleyball
	:ensure t)

;; weather from wttr.in
(use-package wttrin
  :ensure t
  :commands (wttrin)
  :init
  (setq wttrin-default-cities '("Bengaluru"
                                "London")))

;; ===========================================================
;; -----------------------BOOKS-------------------------------
;; ===========================================================

;; get me my favourite SICP book as an 'Info' manual.
;; Source   : https://mitpress.mit.edu/sicp/
;; Also see : http://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-001-structure-and-interpretation-of-computer-programs-spring-2005/video-lectures/
(use-package sicp
	:ensure t)
	
