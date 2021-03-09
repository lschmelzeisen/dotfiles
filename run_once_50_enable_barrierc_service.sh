#!/usr/bin/env sh
systemctl --user daemon-reload
systemctl --user enable barrierc
systemctl --user start barrierc
