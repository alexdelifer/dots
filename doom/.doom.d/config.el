;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here
(setq doom-font (font-spec :family "SF Mono" :size 14)
      doom-big-font (font-spec :family "SF Mono" :size 19))

;; EXWM
(require 'exwm)
(require 'exwm-config)

;; Set the initial workspace number
(setq exwm-workspace-number 4)
(setq exwm-workspace-show-all-buffers t)
(setq exwm-layout-show-all-buffers t)


(exwm-config-default)
(require 'exwm-systemtray)
(exwm-systemtray-enable)
