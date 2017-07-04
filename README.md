# lfs-docker
lfs-test-server Docker image. The container runs the [lfs test
server](https://github.com/git-lfs/lfs-test-server) for use with e.g.
[walrus](https://github.com/fjukstad/walrus) for version control of large
files. All objects are stored to `/lfs` within the container, which you can
mount to a host directory if you want to keep them after the container shuts
down.

# Run
You can run the server using the following command: 

```
docker run -v /HOST/DIRECTORY/lfs:/lfs -p 9999:9999 -t fjukstad/lfs-server 
```

This will starte the server on port `:9999` storing all objects to
`/HOST/DIRECTORY/lfs`. Put this anywhere you'd like. 

# MGMT
You can access the management page on
[localhost:9999/mgmt](http://localhost:9999/mgmt) to e.g. add users or view
objects stored in lfs. 


# Flags 
We have set the following flags: `LFS_METADB=/lfs/lfs.db LFS_LISTEN=tcp://:9999
LFS_HOST=localhost:9999 \ LFS_CONTENTPATH=/lfs LFS_ADMINUSER=admin
LFS_ADMINPASS=admin`. In short we have set the lfs server to store objects in
a `/lfs` directory, listen to port `:9999` and set username/password for the
admin console to `admin`. Note that username/password for the admin console, as
well as other flags, can be set using the `-e` flags in `docker run`. See [the
docs](https://docs.docker.com/engine/reference/run/#env-environment-variables)
for more information. You can find a list of flags
[here](https://github.com/git-lfs/lfs-test-server#running)
