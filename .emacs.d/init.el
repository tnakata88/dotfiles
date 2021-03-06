;;; init.el --- init.el
;;; Commentary:
;;; This is my setting file.
;;; Code:

;;; 右から左に読む言語に対応させないことで描画高速化
(setq-default bidi-display-reordering nil)
;;; splash screenを無効にする
(setq inhibit-splash-screen t)
;;; 同じ内容を履歴に記録しないようにする
(setq history-delete-duplicates t)
;; C-u C-SPC C-SPC ...でどんどん過去のマークを遡る
(setq set-mark-command-repeat-pop t)
;;; 複数のディレクトリで同じファイル名のファイルを開いたときのバッファ名を調整する
(require 'uniquify)
;; filename<dir> 形式のバッファ名にする
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
(setq uniquify-ignore-buffers-re "[^*]+")
;;; ファイルを開いた位置を保存する
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (concat user-emacs-directory "places"))
;;; モードラインに時刻を表示する
;; (display-time nil)
;; (defvar display-time-string-forms)
;; (setq display-time-string-forms
;;   '((format "%s/%s/%s(%s) %s:%s" year month day dayname 24-hours minutes)))
;;; インデントにTABを使わないようにする
(setq-default indent-tabs-mode nil)
;;; 現在行に色をつける
(global-hl-line-mode 1)
;;; ミニバッファ履歴を次回Emacs起動時にも保存する
(savehist-mode 1)
;;; シェルに合わせるため、C-hは後退に割り当てる
(global-set-key (kbd "C-h") 'delete-backward-char)
(define-key key-translation-map (kbd "C-h") (kbd "<DEL>"))
(global-set-key (kbd "C-x C-h") 'help)
;;; 行番号・桁番号を表示する
(line-number-mode 1)
(column-number-mode 1)
;;; GCを減らして軽くする
(setq gc-cons-threshold (* 10 gc-cons-threshold))
;;; ログの記録行数を増やす
(setq message-log-max 10000)
;;; 履歴をたくさん保存する
(setq history-length 1000)
;;; メニューバーとツールバーとスクロールバーを消す
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
;;; set `revert-buffer` to `M-r`
(global-set-key (kbd "M-r") 'revert-buffer)
(global-auto-revert-mode 1)

;;; helm-git-grepで表示候補数をdefaultの300以上にする
(setq helm-git-grep-candidate-number-limit 1500)

; Highlight parenthesis
(show-paren-mode t)

; Not make backup file
(setq make-backup-files nil)

;;; Don't make auto-save-list
(setq auto-save-list-file-prefix nil)

;;; Don't make auto-save-default-file
;; ex) #text.md#
(setq auto-save-default nil)

;;; Don't inset magic comment in ruby-mode
(defvar ruby-insert-encoding-magic-comment nil)

;;; 対応するペアを自動で入力してくれる(), {}, ||, "", ''
(electric-pair-mode t)
(defvar electric-pair-pairs)
(add-to-list 'electric-pair-pairs '(?' . ?'))

;;; set wdired on
(require 'wdired)
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)

;;; add other package list
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (company-nand2tetris nand2tetris nand2tetris-assembler helm-c-yasnippet toml-mode cargo flycheck-rust racer rust-mode rjsx-mode slim-mode coffee-mode vue-mode vue-html-mode typescript-mode haml-mode open-junk-file flycheck-kotlin kotlin-mode geiser quickrun racket-mode protobuf-mode haskell-mode company-c-headers company-go go-mode web-mode ac-php php-mode helm-gtags helm-ag wgrep yaml-mode markdown-mode company flycheck yasnippet helm-ls-git helm-git-grep helm recentf-ext git-gutter+ ruby-test-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(markdown-header-delimiter-face ((t (:inherit org-mode-line-clock))))
 '(markdown-header-face-1 ((t (:inherit outline-1 :weight bold))))
 '(markdown-header-face-2 ((t (:inherit outline-2 :weight bold))))
 '(markdown-header-face-3 ((t (:inherit outline-3 :weight bold))))
 '(markdown-header-face-4 ((t (:inherit outline-4 :weight bold))))
 '(markdown-header-face-5 ((t (:inherit outline-5 :weight bold))))
 '(markdown-header-face-6 ((t (:inherit outline-6 :weight bold))))
 '(markdown-list-face ((t (:inherit org-mode-line-clock))))
 '(markdown-markup-face ((t (:inherit shadow :foreground "green" :slant normal :weight normal))))
 '(markdown-pre-face ((t (:inherit org-formula))))
 '(web-mode-html-tag-bracket-face ((t (:foreground "yellow")))))

;;; Must write installed packages below!!!

;;; set markdown-mode
(progn
 ;; set color in markdown-mode
 (custom-set-faces
  '(markdown-header-delimiter-face ((t (:inherit org-mode-line-clock))))
  '(markdown-header-face-1 ((t (:inherit outline-1 :weight bold))))
  '(markdown-header-face-2 ((t (:inherit outline-2 :weight bold))))
  '(markdown-header-face-3 ((t (:inherit outline-3 :weight bold))))
  '(markdown-header-face-4 ((t (:inherit outline-4 :weight bold))))
  '(markdown-header-face-5 ((t (:inherit outline-5 :weight bold))))
  '(markdown-header-face-6 ((t (:inherit outline-6 :weight bold))))
  '(markdown-pre-face ((t (:inherit org-formula))))
  '(markdown-list-face ((t (:inherit org-mode-line-clock))))
 )
)

;;; set company
(require 'company)
(global-company-mode)
(setq company-idle-delay 0) ; デフォルトは0.5
(setq company-minimum-prefix-length 2)
(setq company-selection-wrap-around t) ; 候補の一番下でさらに下に行こうとすると一番上に戻る
;;; set git-gutter+
(require 'git-gutter+)
(global-git-gutter+-mode t)

;;; set yasnippet
(require 'yasnippet)
(require 'helm-c-yasnippet)
(setq helm-yas-space-match-any-greedy t)
(yas-global-mode 1)
(global-set-key (kbd "C-c y") 'helm-yas-complete)
(setq yas-snippet-dirs
      '("~/dotfiles/.emacs.d/snippets/"
        ))
(yas-load-directory "~/dotfiles/.emacs.d/snippets/")

;;; set recentf-ext
(require 'recentf-ext)
;; 最近のファイル500個を保存する
(setq recentf-max-saved-items 500)
;; 最近使ったファイルに加えないファイルを
;; 正規表現で指定する
(setq recentf-exclude
      '("/TAGS$" "/var/tmp/"))

;;; flycheck
(require 'flycheck)
(global-flycheck-mode)

;;; set helm
(require 'helm-config)
(helm-mode 1)
(global-set-key (kbd "C-x c f") 'helm-find)
(global-set-key (kbd "C-x c m") 'helm-multi-files)
(global-set-key (kbd "C-x c r") 'helm-recentf)
(global-set-key (kbd "C-x c b") 'helm-mini)
(global-set-key (kbd "C-x c o") 'helm-occur)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

;;; set helm-ls-git
(require 'helm-ls-git)
(global-set-key (kbd "C-x g l") 'helm-ls-git-ls)

;;; set helm-git-grep
(require 'helm-git-grep)
(global-set-key (kbd "C-x g g") 'helm-git-grep)

;;; set wgrep
(require 'wgrep nil t)
;;; eでwgrepモードにする
(setf wgrep-enable-key "e")
;;; wgrep終了時にバッファを保存
(setq wgrep-auto-save-buffer t)
;;; read-only bufferにも変更を適用する
(setq wgrep-change-readonly-file t)

;;; set gfm-mode
(add-to-list 'auto-mode-alist '("\\.md\\'" . gfm-mode))

;;; set helm-gtags
(add-hook 'helm-gtags-mode-hook
          '(lambda ()
             ;;入力されたタグの定義元へジャンプ
             (local-set-key (kbd "M-t") 'helm-gtags-find-tag)
             ;;入力タグを参照する場所へジャンプ
             (local-set-key (kbd "M-r") 'helm-gtags-find-rtag)
             ;;入力したシンボルを参照する場所へジャンプ
             (local-set-key (kbd "M-s") 'helm-gtags-find-symbol)
             ;;タグ一覧からタグを選択し, その定義元にジャンプする
             (local-set-key (kbd "M-l") 'helm-gtags-select)
             ;;ジャンプ前の場所に戻る
             (local-set-key (kbd "C-t") 'helm-gtags-pop-stack)))

(add-hook 'php-mode-hook 'helm-gtags-mode)
(add-hook 'ruby-mode-hook
          (lambda()
            (add-to-list 'electric-pair-pairs '(?| . ?|))))
(add-hook 'ruby-mode-hook 'helm-gtags-mode)
(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-to-list 'company-backends 'company-c-headers)
(add-to-list 'company-backends 'company-gtags)

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.hbs?\\'" . web-mode))

(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-enable-auto-closing t)
  (setq web-mode-auto-close-style 2)
  (setq web-mode-tag-auto-close-style 2)
)
(add-hook 'web-mode-hook  'my-web-mode-hook)

;; vuejs
(defvar mmm-submode-decoration-level 0)
;; reactjs
(add-to-list 'auto-mode-alist '(".*\\.js\\'" . rjsx-mode))
(add-hook 'rjsx-mode-hook
          (lambda ()
            (setq indent-tabs-mode nil)
            (setq js2-strict-missing-semi-warning nil)
            (setq js-indent-level 2)))
;; coffeescript
(add-hook 'coffee-mode-hook
          (lambda()
            (setq coffee-tab-width 2)))

;; python
(setq python-shell-interpreter "python3")
(setq python-shell-interpreter-args "-m IPython --simple-prompt -i")

;; go
(add-to-list 'exec-path (expand-file-name "~/dev/go-workspace/bin")) ; go get で入れたツール郡もEmacsから使いたい
(add-to-list 'load-path (concat (getenv "GOPATH")  "/src/github.com/golang/lint/misc/emacs"))
(add-to-list 'load-path (concat (getenv "GOPATH")  "/src/github.com/nsf/gocode/emacs/"))
(add-hook 'go-mode-hook
          (lambda()
            (setq tab-width 4)
            (add-hook 'before-save-hook 'gofmt-before-save)
            (defvar c-basic-offset 4)
            (setq indent-tabs-mode t)
            (set (make-local-variable 'company-backends) '(company-go))
            (company-mode)
            (helm-gtags-mode)
            (setq company-tooltip-limit 20)                      ; bigger popup window
            (setq company-echo-delay 0)                          ; remove annoying blinking
            (setq company-begin-commands '(self-insert-command)) ; start autocompletion only after typing
            (custom-set-faces
             '(company-preview
               ((t (:foreground "darkgray" :underline t))))
             '(company-preview-common
               ((t (:inherit company-preview))))
             '(company-tooltip
               ((t (:background "lightgray" :foreground "black"))))
             '(company-tooltip-selection
               ((t (:background "steelblue" :foreground "white"))))
             '(company-tooltip-common
               ((((type x)) (:inherit company-tooltip :weight bold))
                (t (:inherit company-tooltip))))
             '(company-tooltip-common-selection
               ((((type x)) (:inherit company-tooltip-selection :weight bold))
                (t (:inherit company-tooltip-selection)))))
            (require 'golint)))

;; rust
(add-to-list 'exec-path (expand-file-name "~/.cargo/bin/"))
(setq rust-format-on-save t)
(add-hook 'rust-mode-hook 'cargo-minor-mode)
(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
(with-eval-after-load 'rust-mode
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))
(add-hook 'racer-mode-hook #'company-mode)

(setq nand2tetris-core-base-dir "~/workspace/nand2tetris")
(add-to-list 'auto-mode-alist '("\\.hdl?\\'" . nand2tetris-mode))
(add-to-list 'auto-mode-alist '("\\.tst?\\'" . nand2tetris-mode))
(add-to-list 'auto-mode-alist '("\\.cmp?\\'" . nand2tetris-mode))

;;; init.el ends here
