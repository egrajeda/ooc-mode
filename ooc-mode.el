;;; ooc-mode.el --- Major mode for editing .ooc files

;;; Copyright 2009 Eduardo Grajeda Blandón

;;; Author: Eduardo Grajeda Blandón <tatofoo@gmail.com>
;;; Version: 0.1
;;; Keywords: ooc

;;; This mode is a fork of the great pod-mode, created by Steffen Schwigon. 
;;; For more information you can go to:
;;;
;;;   http://github.com/renormalist/emacs-pod-mode

;;; This program is free software; you can redistribute it and/or modify
;;; it under the terms of the GNU General Public License as published by
;;; the Free Software Foundation; either version 2, or (at your option)
;;; any later version.
;;;
;;; This program is distributed in the hope that it will be useful,
;;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;; GNU General Public License for more details.
;;;
;;; You should have received a copy of the GNU General Public License
;;; along with this program; if not, write to the Free Software
;;; Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

;;; Put this file into your load-path and the following into your ~/.emacs:
;;;
;;;    (require 'ooc-mode)
;;;
;;;
;;; To associate ooc-mode with .ooc files add the following to your ~/.emacs
;;;
;;;    (setq auto-mode-alist
;;;       (append auto-mode-alist
;;;         '(("\\.ooc$" . ooc-mode))))
;;;
;;;
;;; To automatically turn on font-lock-mode add the following to your ~/.emacs
;;;
;;;    (add-hook 'ooc-mode-hook 'font-lock-mode)

;;; Code:

;; default variables
(defvar ooc-mode-hook nil)

;; keymap
(defvar ooc-mode-map nil "Keymap for OOC major mode.")
(if ooc-mode-map nil
  (let ((map (make-sparse-keymap)))
    ;; insert (define-key map ...) stuff here
    (setq ooc-mode-map map)))

;; syntax highlighting: standard keywords
(defconst ooc-font-lock-keywords-1
  '(
    ("\\<\\(class\\|func\\)\\>" 0 font-lock-keyword-face)
    ("^[ \t]+\\(.*\\)$" 1 font-lock-type-face)
    )
  "Minimal highlighting expressions for OOC mode.")

;; default level of highlight to maximum
(defvar ooc-font-lock-keywords ooc-font-lock-keywords-1
  "Default highlighting expressions for OOC mode")

;; no special indenting, just pure text mode
(defun ooc-indent-line ()
  "Indent current line as OOC code. Does nothing yet."
  (interactive)
  )

;; no special syntax table
(defvar ooc-mode-syntax-table nil
  "Syntax table for ooc-mode.")

;; create and activate syntax table
(defun ooc-create-syntax-table ()
  (if ooc-mode-syntax-table
      ()
    (setq ooc-mode-syntax-table (make-syntax-table))
    (set-syntax-table ooc-mode-syntax-table)
    ))

;; main
(defun ooc-mode ()
  "Major mode for editing OOC files (Plain Old Documentation for Perl)."
  (interactive)
  (kill-all-local-variables)
  (ooc-create-syntax-table)
  (use-local-map ooc-mode-map)
  (make-local-variable 'font-lock-defaults)
  (setq font-lock-defaults '(ooc-font-lock-keywords 't))
  ;; (make-local-variable 'indent-line-function)
  ;; (setq indent-line-function 'ooc-indent-line)
  (setq major-mode 'ooc-mode)
  (setq mode-name "OOC")
  (setq imenu-generic-expression '((nil "^=head[1234] +\\(.*\\)" 1)))
  (run-hooks 'ooc-mode-hook)
  )

(provide 'ooc-mode)

;;; ooc-mode.el ends here
