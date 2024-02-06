#!/bin/bash

echo "post-start start" >> ~/status

if ! grep -q tty /home/vscode/.bashrc; then
  echo "export GPG_TTY=\$(tty)" >> /home/vscode/.bashrc
fi

echo "post-start complete" >> ~/status
