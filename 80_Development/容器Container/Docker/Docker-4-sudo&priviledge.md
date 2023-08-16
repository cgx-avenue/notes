# Background - why sudo is needed for docker-cli
When we use docker commands, we always use sudo as prefix, otherwise it wil show like below:
![](imgs/2023-08-16-09-47-43.png)
which shows lacking of permission.
The reason is:
> The Docker daemon binds to a Unix socket, not a TCP port. By default it’s the `root` user that owns the Unix socket, and other users can only access it using `sudo`. The Docker daemon always runs as the `root` user.

# Manage docker as a non-root user
Can we bypass the sudo prefix? Yes we can. 



# Refs
1. https://docs.docker.com/engine/install/linux-postinstall/