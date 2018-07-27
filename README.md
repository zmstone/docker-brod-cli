# brod-cli in docker container

## example usage

```
> docker run --net host -it --rm zmstone/brod brod -h
usage:
  brod -h|--help
  brod -v|--version
  brod <command> [options] [-h|--help] [--verbose|--debug]

commands:
  meta:    Inspect topic metadata
  offset:  Inspect offsets
  fetch:   Fetch messages
  send:    Produce messages
  pipe:    Pipe file or stdin as messages to kafka
  groups:  List/describe consumer group
  commits: List/descibe committed offsets
           or force overwrite existing commits
```
