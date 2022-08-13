# `term-world` World Container

This repository contains the latest full `term-world` container build. This container
incorporates all `term-world` packages and necessary Python modules for conducting
the CMPSC 100 course at Allegheny College. It is designed for use with the associated
dispatcher, `[term-hub](https://github.com/term-world/term-hub)`.

## Using this container

### `pull`ing from ghcr.io

To retrieve this container from the GitHub Container Registry:

```
docker pull ghcr.io/term-world/world:latest
```

### Using independent from `term-hub`

Linked above, `term-hub` provides the necssary environment variables and binding
properties as part of container dispatch. To use the image _without_ this infrastructure,
launching a container requires:

|Environment variable |Purpose                                                           |
|:--------------------|:-----------------------------------------------------------------|
|`VS_USER`            |The in-world user meant for the container instance                |
|`DISTRICT`           |The name of the district of which the user is a member            |
|`GID`                |The `gid` of the group associated with the `DISTRICT`             |

Some of these, including the `GID` are products of the 
`[world-configure](https://github.com/term-world/world-configure)` Ruby script. 

## Disclaimer

If you're reading this, much of this work is still largely in _alpha_. This means that it's
more than likely that this infrastructure still requires a fair amount of manual build.
