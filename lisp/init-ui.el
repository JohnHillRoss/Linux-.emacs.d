;;关闭工具栏
(tool-bar-mode -1)

;;关闭滑动控件
(scroll-bar-mode -1)

;;显示行号
(global-linum-mode 1)

;;显示当前行
(global-hl-line-mode 1)

;;更改光标样式
(setq-default cursor-type 'bar)

;;关闭启动帮助画面
(setq inhibit-splash-screen -1)

;;更改显示字体大小
(set-face-attribute 'default nil :height 160)

;;全屏开启
(setq initial-frame-alist (quote ((fullscreen . maximized))))

(provide 'init-ui)
