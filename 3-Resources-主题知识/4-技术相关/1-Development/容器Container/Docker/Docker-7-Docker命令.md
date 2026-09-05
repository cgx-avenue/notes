# docker export
Export a container’s filesystem as a tar archive
```bash
docker export [OPTIONS] CONTAINER
```

```bash
#examples，sanme result
docker export red_panda > latest.tar
docker export --output="latest.tar" red_panda
```