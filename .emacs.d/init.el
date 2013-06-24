;;; Utility
;;  文字コードを指定
( set-language-environment "Japanese" )
( prefer-coding-system 'utf-8 )

;; load-pathを追加する関数を定義
( defun add-to-load-path( &rest paths )
  ( let( path )
    ( dolist( paths paths paths )
      ( let(( default-directory
              ( expand-file-name( concat user-emacs-directory path ))))
        ( add-to-list 'load-path default-directory )
        ( if( fboundp 'normal-top-level-add-subdirs-to-load-path )
          ( normal-top-level-add-subdirs-to-load-path ))))))

;; 引数のディレクトリとそのサブディレクトリをload-pathに追加
( add-to-load-path "elisp" "conf" "public_repos" )

;; バックアップとオートセーブファイルの作成ディレクトリを変更
( add-to-list 'backup-directory-alist
              ( cons "." "~/.emacs.d/backups/"))
( setq auto-save-file-name-transforms
       `(( ".*" ,( expand-file-name "~/.emacs.d/backups/") t )))

;; Elisp関数、変数の情報をエコーエリアに表示
( add-hook 'emacs-lisp-mode-hook
           '( lambda ()
                ( when( require 'eldoc nil t )
                     ( setq eldoc-idle-delay 0.2 )
                     ( setq eldoc-echo-area-use-moltiline-p t )
                     ( turn-on-eldoc-mode ))))

;; オートセーブの間隔を変更する
;;( setq auto-save-timeout 15 )
;;( setq auto-save-interval 60 )

;; カラーテーマの読み込み
( when( require 'color-theme nil t )
  ( color-theme-initialize ) )

;;タイトルバーにファイルのフルパスを表示
( setq frame-title-format "%f" )

;; ファイルサイズを表示
( size-indication-mode t )

;; カラム番号を表示
( column-number-mode t )

;; 行番号を常に表示
( global-linum-mode t )
( setq linum-format "%03d  ")

;; 現在行のハイライト
( defface my-hl-line-face
  '(((( class color )( background dark ))
     ( :background "NavyBlue" t ))
    ( t ( :bold t )))
    "hl-line's my face" )
;;( setq hl-line-face 'my-hl-line-face )
;;( global-hl-line-mode t )

;; 対応する括弧のハイライト
( setq show-paren-delay 0 )
( show-paren-mode t )
( setq show-paren-style 'expression )
;;( set-face-background 'show-paren-match-face "Yellow" )
;;( set-face-underline-p 'show-paren-match-face "Yellow")

;; インデントにタブ文字を使用しない
( setq-default indent-tabs-mode nil )

;; タブ文字の表示幅
( setq-default tab-width 2 )

;;; Short-cut
;; 改行と同時にインデントする
( global-set-key( kbd "C-m" ) 'newline-and-indent )

;; バッファウィンドウの立て幅を調整
( global-set-key( kbd "M-d") 'shrink-window )
( global-set-key( kbd "M-u") 'enlarge-window )
;;( global-set-key( kbd "M-") 'shrink-window-verticaly )
;;( global-set-key( kbd "M-") 'shrink-window-verticaly )
