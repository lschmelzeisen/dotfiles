# awesome-gnome

Configuration to run [awesome](https://awesomewm.org/) in a [GNOME](https://www.gnome.org/) session.

Based on [SirJson/awesomewm-gnome](https://github.com/SirJson/awesomewm-gnome) (which is in turn a form of [i3-gnome](https://github.com/i3-gnome/i3-gnome)) but modified to run via [systemd](https://www.freedesktop.org/wiki/Software/systemd/) instead of a normal executable.
Running via systemd is preferrable because nowadays GNOME manages all its components via systemd and it is unclear if the normal executable way is compatible with new GNOME developments.
Additionally, it allows us to inspect logs via `journalctl --user -u awesome-gnome`.

## Implementation

Installation in this repository is handled by [chezmoi](https://www.chezmoi.io/) and configured in `../run_once_install_dependencies.sh.tmpl`, which specifies to which locations the following files are installed:

* `awesome-gnome.xsession.desktop`:
  Defines the session.
  Will be read by [GDM](https://wiki.gnome.org/Projects/GDM) and adds it to the list of available sessions on the log in screen.
  The `Exec` directive tells GDM to start this session via systemd according to the declaration in `awesome-gnome.session.conf`.
  Additionally, GDM will check `awesome-gnome.session` to verify that all required components of the session have started.

* `awesome-gnome.session.conf`:
  Lists the systemd targets that should be started as part of this session.
  Specifically, depends on target `awesome-gnome.target`.

* `awesome-gnome.target`:
  Defines a systemd target which can be used by systemd units.
  Specifically, depends on `awesome-gnome.service`.

* `awesome-gnome.service`:
  Starts the awesome window manager.

* `awesome-gnome.session`:
  List of all required components that need to start as part of this session ([documentation](https://wiki.gnome.org/Projects/SessionManagement/RequiredComponents)).
  Note that GDM will not actually start any of the components listed here.
  Instead, it will check all `.desktop` files (in our case `awesome-gnome.desktop`) for which applications provide which components.
  Then, in case one of these applications is not started as part of the session (in our case via `awesome-gnome.session.conf`) it will show an error screen.

* `awesome-gnome.desktop`:
  Specifies which GNOME component awesome-gnome provides.
  Note, that unlike most other `.desktop` files, this does not specify an executable application, i.e., it has no `Exec` directive.

* `awesome-gnome.gschema.override`:
  Sets standard GSettings values to be used for this session.

To handle the GNOME session, we run [GNOME Flashback](https://wiki.gnome.org/Projects/GnomeFlashback) opposed to the regular [GNOME Shell](https://wiki.gnome.org/Projects/GnomeShell) because the former allows to change its window manager, while the latter does not.
Additionally, all the above files are basically light modified versions of their GNOME Flashback counterparts, which should be checked for changes with each GNOME update.
