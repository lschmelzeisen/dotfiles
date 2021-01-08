# Lukas Schmelzeisen's dotfiles

My system configuration.

## Installation

[Install chezmoi](https://www.chezmoi.io/docs/install/) and run:

```sh
chezmoi init --apply --verbose https://github.com/lschmelzeisen/dotfiles
chezmoi apply
```

The above command will try to install all dependencies automatically.
If your system does not support this, it will print a list of dependencies to be installed.

But you probably should not just run these scripts without manually checking
them first, as they will also modify your system configuration.
So far, fully automated installation has not been tested.
I know at least once after installing everything a reboot is required, but reboots
could also be required at specific installations steps in between.

## License

Copyright 2020 Lukas Schmelzeisen.
Licensed under the [Apache License, Version 2.0](https://www.apache.org/licenses/LICENSE-2.0).
