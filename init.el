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
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 140 :foundry "nil" :family "Input Mono Narrow"))))
 '(cursor ((t (:background "magenta4"))))
 '(link-visited ((t (:foreground "dark magenta" :underline t :weight normal))))
 '(magit-branch-current ((t (:inherit magit-branch-local :box 1 :weight bold))))
 '(mode-line ((t (:background "wheat2" :foreground "#272b34" :box (:line-width 2 :color "grey75" :style released-button)))))
 '(mode-line-inactive ((t (:inherit mode-line :background "#dedbd7" :foreground "#495259" :box (:line-width 2 :color "grey75" :style released-button)))))
 '(org-level-1 ((t (:foreground "#cd00cd" :weight bold :height 1.2))))
 '(org-level-2 ((t (:foreground "coral3" :weight bold :height 1.1))))
 '(org-level-3 ((t (:foreground "purple3" :weight bold))))
 '(org-level-4 ((t (:foreground "dark magenta" :weight bold))))
 '(org-special-keyword ((t (:foreground "red1" :weight bold)))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
	 ["#3f3f3f" "#ea3838" "#7fb07f" "#fe8b04" "#62b6ea" "#e353b9" "#1fb3b3" "#d5d2be"])
 '(column-number-mode t)
 '(custom-safe-themes
	 (quote
		("cdd26fa6a8c6706c9009db659d2dffd7f4b0350f9cc94e5df657fa295fffec71" "e8825f26af32403c5ad8bc983f8610a4a4786eb55e3a363fa9acb48e0677fe7e" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "ab04c00a7e48ad784b52f34aa6bfa1e80d0c3fcacc50e1189af3651013eb0d58" "a0feb1322de9e26a4d209d1cfa236deaf64662bb604fa513cca6a057ddf0ef64" "7bd626fcc9fbfb44186cf3f08b8055d5a15e748d5338e47f9391d459586e20db" "392f19e7788de27faf128a6f56325123c47205f477da227baf6a6a918f73b5dc" "9dc64d345811d74b5cd0dac92e5717e1016573417b23811b2c37bb985da41da2" "9a3c51c59edfefd53e5de64c9da248c24b628d4e78cc808611abd15b3e58858f" "1a094b79734450a146b0c43afb6c669045d7a8a5c28bc0210aba28d36f85d86f" "4c8372c68b3eab14516b6ab8233de2f9e0ecac01aaa859e547f902d27310c0c3" "39a854967792547c704cbff8ad4f97429f77dfcf7b3b4d2a62679ecd34b608da" "7356632cebc6a11a87bc5fcffaa49bae528026a78637acd03cae57c091afd9b9" "5e3fc08bcadce4c6785fc49be686a4a82a356db569f55d411258984e952f194a" "7153b82e50b6f7452b4519097f880d968a6eaf6f6ef38cc45a144958e553fbc6" default)))
 '(diary-entry-marker (quote font-lock-variable-name-face))
 '(emms-mode-line-icon-image-cache
	 (quote
		(image :type xpm :ascent center :data "/* XPM */
static char *note[] = {
/* width height num_colors chars_per_pixel */
\"    10   11        2            1\",
/* colors */
\". c #1fb3b3\",
\"# c None s None\",
/* pixels */
\"###...####\",
\"###.#...##\",
\"###.###...\",
\"###.#####.\",
\"###.#####.\",
\"#...#####.\",
\"....#####.\",
\"#..######.\",
\"#######...\",
\"######....\",
\"#######..#\" };")))
 '(fci-rule-color "#222222")
 '(global-company-mode t)
 '(gnus-logo-colors (quote ("#2fdbde" "#c0c0c0")))
 '(gnus-mode-line-image-cache
	 (quote
		(image :type xpm :ascent center :data "/* XPM */
static char *gnus-pointer[] = {
/* width height num_colors chars_per_pixel */
\"    18    13        2            1\",
/* colors */
\". c #1fb3b3\",
\"# c None s None\",
/* pixels */
\"##################\",
\"######..##..######\",
\"#####........#####\",
\"#.##.##..##...####\",
\"#...####.###...##.\",
\"#..###.######.....\",
\"#####.########...#\",
\"###########.######\",
\"####.###.#..######\",
\"######..###.######\",
\"###....####.######\",
\"###..######.######\",
\"###########.######\" };")))
 '(indent-tab-mode nil t)
 '(menu-bar-mode nil)
 '(package-selected-packages
	 (quote
		(sunshine graphviz-dot-mode farmhouse-theme rainbow-identifiers rainbow-mode abyss-theme alect-themes restclient paredit sass-mode wttrin jumblr yaml-mode json-mode web-mode use-package smex smartparens slime-volleyball slime sicp shakespeare-mode s pdf-tools markdown-mode magit lorem-ipsum git-gutter exec-path-from-shell color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized color-theme-modern chess)))
 '(pdf-tools-handle-upgrades nil)
 '(safe-local-variable-values
	 (quote
		((haskell-process-use-ghci . t)
		 (haskell-indent-spaces . 2))))
 '(show-paren-mode t)
 '(sunshine-location "Bengaluru, India")
 '(sunshine-units (quote metric))
 '(tab-width 2)
 '(tool-bar-mode nil)
 '(vc-annotate-background "#222222")
 '(vc-annotate-color-map
	 (quote
		((20 . "#db4334")
		 (40 . "#ea3838")
		 (60 . "#abab3a")
		 (80 . "#e5c900")
		 (100 . "#fe8b04")
		 (120 . "#e8e815")
		 (140 . "#3cb370")
		 (160 . "#099709")
		 (180 . "#7fb07f")
		 (200 . "#32cd32")
		 (220 . "#8ce096")
		 (240 . "#528d8d")
		 (260 . "#1fb3b3")
		 (280 . "#0c8782")
		 (300 . "#00aff5")
		 (320 . "#62b6ea")
		 (340 . "#94bff3")
		 (360 . "#e353b9"))))
 '(vc-annotate-very-old-color "#e353b9"))

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

;;;; LOAD Rainbow mode also when opening files of type *.css
;; css-mode (MAJOR) plus rainbow-mode(MINOR) 
(defun css-mode-and-rainbow-mode() (css-mode) (rainbow-mode))
;; Load both major and minor modes in one call based on file type of .css
(add-to-list 'auto-mode-alist '("\\.css$" . css-mode-and-rainbow-mode))

;; get magit for working with Git
;; also bind its popular chord "C-x g" to magit-status pop-up!
(use-package magit
  :ensure t
  :pin melpa-stable
  :bind ("C-x g" . magit-status))

;; From the magit team! For git configs
(use-package gitconfig-mode
	:ensure t)

;; From the magit team! For git attributes
(use-package gitattributes-mode
	:ensure t)

;; From the magit team! For gitignore files
(use-package gitignore-mode
	:ensure t)

;; get git-timemachine & see git-revisions of a file back in time! :)
;; Use 'M-x git-timemachine' to see!
;; source: https://github.com/pidu/git-timemachine
(use-package git-timemachine
	:ensure t)

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

;; show colors for color-codes
(use-package rainbow-mode
	:ensure t)

;; handle .dot files! :)
(use-package graphviz-dot-mode
	:ensure t)
 
;; get rainbow-identifiers
(use-package rainbow-identifiers
	:ensure t)

;; get the lorem-ipsum package to insert standard Latin text 
(use-package lorem-ipsum
  :ensure t)

;; get the superb company-mode for text completion suggestions! :)
;; source: http://company-mode.github.io/
(use-package company
	:ensure t)

;; web related completions
(use-package company-web
	:ensure t)

;; quick help in a nice manner!
(use-package company-quickhelp
	:ensure t)

;; math help via company
(use-package company-math
	:ensure t)

;; ghc help via company
(use-package company-ghc
	:ensure t)

;; ghci help via company
(use-package company-ghci
	:ensure t)

;; CABAL help via company
(use-package company-cabal
	:ensure t)

;; TeXnical help via company
(use-package company-auctex
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

;; get Tomorrow themes!
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

(use-package farmhouse-theme
	:ensure t)

;; Load the current-favourite default theme at start-up! :)
;; (load-theme #'abyss t)
;; (load-theme #'sanityinc-solarized-light t)
;; (load-theme #'sanityinc-solarized-dark t)
(load-theme #'farmhouse-light)

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

;; weather info from Aaron Bieber's sunshine package! :)
(use-package sunshine
	:ensure t
	:init
	(setq sunshine-show-icons t))


;; ===========================================================
;; -----------------------BOOKS-------------------------------
;; ===========================================================

;; get me my favourite SICP book as an 'Info' manual.
;; Source   : https://mitpress.mit.edu/sicp/
;; Also see : http://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-001-structure-and-interpretation-of-computer-programs-spring-2005/video-lectures/
(use-package sicp
	:ensure t)

