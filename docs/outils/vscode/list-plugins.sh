#!/bin/bash

code --list-extensions | xargs -L 1 echo code --install-extension

