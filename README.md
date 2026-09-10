# AERA App Backup Vault

App Backup Vault is AERA Recovery Project's encrypted, per-app backup plugin.
The recovery host provides the native LVGL interface and narrowly controls the
backup operations; this repository supplies the signed restic runtime that is
expanded into RAM only while the app is open.

Version 1.0.0 supports repositories on internal storage and mounted AERA NAS
storage, app selection, encrypted snapshots, snapshot discovery, and confirmed
restore to the original offline app-data locations.

The runtime bundles an unmodified Android arm64 build of
[restic 0.19.1](https://github.com/restic/restic/tree/v0.19.1), originally
distributed in the Restoid 0.6.6 arm64 package. restic is licensed under the
BSD 2-Clause License; its license is included in the payload.

The password is passed through a private temporary file and is never written to
the plugin manifest or persistent AERA settings.
