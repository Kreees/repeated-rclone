# Repeated rclone

Repeatedly clone content of source to target volume using [rclone](https://rclone.org/)

Image is based on [official rclone image](https://hub.docker.com/r/rclone/rclone)

# Usage

```bash
# Clone source content to target once
$ docker run \
    --env "SOURCE=<sourcelocation>" \
    --env "TARGET=<targetlocation>" \
    -v <rclonefile>:/rclone.conf \
    kreees/repeated-rclone

# Clone source content to target localdir every 1 hour
$ docker run \
    --env "SOURCE=<sourcelocation>" \
    --env "REPEATEVERY=3600" \
    -v <targetdir>:/mnt \
    -v <rclonefile>:/rclone.conf \
    kreees/repeated-rclone  

# Sync localdir nonexisting content to remote target once
$ docker run \
    --env "TARGET=<targetlocation>" \
    --env "ACTION=sync" \
    --env "EXTRA=--ignore-existing"
    -v <sourcedir>:/mnt \
    -v <rclonefile>:/rclone.conf \
    kreees/repeated-rclone
```

# Params

- [Rclone config](https://rclone.org/docs/#config-config-file) - should be mounted to /rclone.conf destination (optional)
- **$SOURCE** - source location (default: `/mnt`)
- **$TARGET** - target location (default: `/mnt`)
- **$ACTION** - rclone action (default: `copy`)
- **$REPEATEVERY** - repeat action every $REPEATEVERY seconds (default: `0`, means once)
- **$EXTRA** - extra arguments passed at the end of command

---

LICENSE: UNLICENSED