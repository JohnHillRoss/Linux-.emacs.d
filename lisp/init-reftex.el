;;自定义reftex

(setq reftex-plug-into-AUCTeX t)

(setq reftex-enable-partial-scans t)

(setq reftex-save-parse-info t)

(setq reftex-use-multiple-selection-buffers t)

(autoload 'reftex-mode "reftex" "RefTex Minor Mode" t)

(autoload 'turn-on-reftex "reftex" "RefTex Minor Mode" nil)

(autoload 'reftex-citation "reftex-cite" "Make citation" nil)

(autoload 'reftex-index-phrases-mode "reftex-index" "Phrase mode" t)

;;*toc*buffer在左侧。 
(setq reftex-toc-split-windows-horizontally t)

;;*toc*buffer使用整个frame的比例。 
(setq reftex-toc-split-windows-fraction 0.2)

(provide 'init-reftex)
