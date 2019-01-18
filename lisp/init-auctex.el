;;开启自动保存
(setq TeX-auto-save t)

;;开启自我解析
(setq TeX-parse-self t)

;;默认关闭tex
(setq-default TeX-master nil)

;;开启pdf阅读模式
(setq TeX-PDF-mode t)

;;开启反向搜索
(setq TeX-source-correlate-mode t)

;;设置反向搜索方式为synctex
(setq TeX-source-correlate-method 'synctex)

;;设置pdf阅读器
(setq TeX-view-program-list
      '(("Sumatra PDF" ("\"d:/Software/SumatraPDF/SumatraPDF.exe\" -reuse-instance"
                        (mode-io-correlate " -forward-search %b %n -inverse-search \"d:/Software/Emacs/emacs-26.1-x86_64/bin/emacsclientw.exe -n +%%l %%f\"") " %o"))))
(eval-after-load 'tex
  '(progn
     (assq-delete-all 'output-pdf TeX-view-program-selection)
     (add-to-list 'TeX-view-program-selection '(output-pdf "Sumatra PDF"))))

;;设置编译引擎为XeLaTeX
(add-hook 'LaTeX-mode-hook
          #'(lambda ()
              (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex --synctex=1%(mode)%' %t" TeX-run-TeX nil t))
	      (setq TeX-command-extra-options "-file-line-error -shell-escape")
	      (setq TeX-command-default "XeLaTeX")
	      (setq TeX-save-query  nil)
	      ))

(setq TeX-view-program-selection '(((output-dvi style-pstricks) "dvips and start") (output-dvi "Yap") (output-pdf "Sumatra PDF") (output-html "start")))

(setq TeX-output-view-style '(("^dvi$" "^pstricks$\\|^pst-\\|^psfrag$" "dvips %d -o && start \"\" %f") ("^dvi$" "." "yap -1 %dS %d") ("^pdf$" "." "d:/Software/SumatraPDF/SumatraPDF.exe -reuse-instance \"\" %o") ("^html?$" "." "start \"\" %o")))

;;开启正向搜索
(setq TeX-source-correlate-start-server t)

;;开启正向搜索,shift+鼠标右键
(add-hook 'LaTeX-mode-hook
          (lambda ()
	    (local-set-key (kbd "<S-mouse-3>") #'TeX-view)
	    ))

;;在菜单栏添加index,math
(add-hook 'LaTeX-mode-hook
	  (lambda ()
	    (imenu-add-menubar-index)
	    (LaTeX-math-mode)
	    ))

(provide 'init-auctex)
