;;开启自动保存
(setq TeX-auto-save t)

;;开启自我解析
(setq TeX-parse-self t)

;;默认关闭tex
(setq-default TeX-master nil)

;;自定义编辑LaTeX模式
(mapc (lambda (mode)
	(add-hook 'LaTeX-mode-hook mode)
	)
      (list
       'auto-complete-mode
       'auto-fill-mode
       'LaTeX-math-mode
       'turn-on-reftex
       'linum-mode
       ))

;;自定义编辑LaTeX方法
(add-hook 'LaTeX-mode-hook(lambda ()
			    (setq TeX-auto-untabify t     ; remove all tabs before saving
				  TeX-engine 'xetex       ; use xelatex default
				  TeX-show-compilation t  ; display compilation windows
				  )
			    (TeX-global-PDF-mode t)       ; PDF mode enable, not plain
			    (setq TeX-save-query nil)
			    (imenu-add-menubar-index)
			    (define-key LaTeX-mode-map (kbd "TAB") 'TeX-complete-symbol)
			    ))
;;修改pdf阅读器
(setq TeX-view-program-list '(("Evince" "evince %o")))
(cond
 ;;windows平台使用SumatraPDF
 ((eq system-type 'windows-nt)
  (add-hook 'LaTeX-mode-hook
	    (lambda ()
	      (setq TeX-view-program-selection '((output-pdf "SumatraPDF")
                                                 (output-dvi "Yap")
						 )))))
 ;;linux平台使用Evince
 ((eq system-type 'gnu/linux)
  (add-hook 'LaTeX-mode-hook
            (lambda ()
              (setq TeX-view-program-selection '((output-pdf "Evince")
                                                 (output-dvi "Evince")
						 ))))))
;;编辑引擎改为XeLaTeX
(add-hook 'LaTeX-mode-hook (lambda()
			     (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-TeX nil t))
			     (setq TeX-command-default "XeLaTeX")
			     (setq TeX-save-query  nil )
			     (setq TeX-show-compilation t)
			     ))

(provide 'init-auctex)
