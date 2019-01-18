;;设置swiper和counsel快捷键
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)

;;将函数open-init-file绑定在<f1>键上
(global-set-key (kbd "<f1>") 'open-init-file)

;;用快捷键绑定打开最近打开过的文件的图形界面,或者按C-x b进入输入的buffer
(global-set-key (kbd "C-x C-r") 'recentf-open-files)

;;查询变量,函数,命令
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

;;打开org-agenda快捷键
(global-set-key (kbd "C-c C-a") 'org-agenda)

;;查看git仓库文件
(global-set-key (kbd "C-c C-p C-f") 'counsel-git)

;;自动缩进
(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)

;;完善自动补全
(global-set-key (kbd "C-/") 'hippie-expand)

;;C-x C-j打开当前所在Dired
;;C-x d,进入Dired
;;按+新建文件夹
;;回车进入文件夹
;;C-x C-f生成文件
;;按g刷新Dired
;;按C(大写)copy光标所在文件，然后命名生成
;;按d删除光标所在文件,按x执行
;;按D(大写)不用按x
;;按R(大写)重命名

;;加载完Dired再执行下面语句
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

(provide 'init-keybindings)
