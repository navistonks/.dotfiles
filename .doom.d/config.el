;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Navier Stokes"
      ;; Yes, I know this is public.
      user-mail-address "navier.stk@protonmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:

(setq doom-theme 'doom-monokai-octagon)
(setq doom-font "JetBrains Mono")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Documents/org/")
(setq org-agenda-files '("~/Documents/org/agenda.org"))
(after! org
  ;; Place timestamp after setting a todo to "DONE"
  (setq org-log-done 'time)
  (setq org-log-repeat 'note))

;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded - `add-load-path!' for adding directories to the `load-path', relative to this file. Emacs searches the `load-path' when you load packages with `require' or `use-package'. - `map!' for binding new keys

;; Github Copilot
;; Accept completion from copilot and fallback to company
(use-package! copilot
  :hook (prog-mode . copilot-mode)
  :bind (
         :map copilot-completion-map
         ("C-SPC" . 'copilot-accept-completion-by-word)
         ("TAB" . 'copilot-accept-completidon-by-word)))

;; Hooks for Clojure structural editing
(add-hook 'clojure-mode-hook 'smartparens-strict-mode)
(add-hook 'smartparens-strict-mode-hook 'evil-cleverparens-mode)

;; Needed for evil-cleverparens to work properly
(setq evil-move-beyond-eol t)

;; Only check syntax on buffer save or mode change
(setq flycheck-check-syntax-automatically '(save mode-enable))
(load! "keybindings.el")

;; Automatically close HTML tags
(setq web-mode-auto-close-style 2)
