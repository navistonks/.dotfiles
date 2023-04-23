;;; keybindings.el -*- lexical-binding: t; -*-

;; Entire function block
(define-key evil-outer-text-objects-map "f" (evil-textobj-tree-sitter-get-textobj "function.outer"))

;; Function block without name and args
(define-key evil-inner-text-objects-map "f" (evil-textobj-tree-sitter-get-textobj "function.inner"))

;; Goto start of next function
(define-key evil-normal-state-map (kbd "]f") (lambda ()
                                               (interactive)
                                               (evil-textobj-tree-sitter-goto-textobj "function.outer")))
;; Goto start of previous function
(define-key evil-normal-state-map (kbd "[f") (lambda ()
                                               (interactive)
                                               (evil-textobj-tree-sitter-goto-textobj "function.outer" t)))
;; Goto end of next function
(define-key evil-normal-state-map (kbd "]F") (lambda ()
                                               (interactive)
                                               (evil-textobj-tree-sitter-goto-textobj "function.outer" nil t)))
;; Goto end of previous function
(define-key evil-normal-state-map (kbd "[F") (lambda ()
                                               (interactive)
                                               (evil-textobj-tree-sitter-goto-textobj "function.outer" t t)))
(defun open-agenda-file ()
  "Open the first file in 'org-agenda-files'"
  (interactive)
  (find-file (car org-agenda-files)))

(map! :leader :desc "Open agenda file" :n "o a o" #'open-agenda-file)
