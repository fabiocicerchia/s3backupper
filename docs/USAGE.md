---
permalink: /docs/USAGE/
---
# USAGE

```
S3Backupper v1.0.0 by Fabio Cicerchia

Usage: s3backupper [COMMAND] [-h] [-dv] [RESTORE_FOLDER]

Commands:

backup    Create a new backup snapshot.
browse    Mount locally and browse the files.
help      Show help.
restore   Restore an existent backup snapshot.
version   Print current version.

Options:

-d   Enable Deep Integrity Checks.
     Since it has to download all data files in the repository,
     beware that it might incur higher bandwidth costs than usual
     and also that it takes more time than the default check.
     (default: off)
-v   Verbose.
-h   Help.

Examples:

 s3backupper backup -d
 s3backupper browse /mnt/latest-backup
 s3backupper restore /path/to/restored/backup
```

## File List

Change the file `/usr/local/s3backupper/conf/files`.

```
# You can use the glob notation in order to match the files and/or folders you
# wish to backup.
#
# Have a look at https://linuxhint.com/bash_globbing_tutorial/ and at
# https://facelessuser.github.io/wcmatch/glob/ in order to understand better how
# glob works.
```
