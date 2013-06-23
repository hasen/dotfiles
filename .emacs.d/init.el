;;; Utility
;;  文字コードを指定
( set-language-environment "Japanese" )
( prefer-coding-system 'utf-8 )

;;  load-pathを追加する関数を定義
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

;;タイトルバーにファイルのフルパスを表示
( setq frame-title-format "%f" )

;; ファイルサイズを表示
( size-indication-mode t )

;; 行番号を常に表示
( global-linum-mode t )

( setq linum-format "%03d  ")

;; カラム番号を表示
( column-number-mode t )


;;; Short-cut
;; 改行と同時にインデントする
( global-set-key( kbd "C-m" ) 'newline-and-indent )







