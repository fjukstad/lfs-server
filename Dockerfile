FROM golang 

# Install the lfs-test-server 
RUN go get github.com/git-lfs/lfs-test-server

RUN mkdir /lfs
ENV LFS_METADB=/lfs/lfs.db LFS_LISTEN=tcp://:9999 LFS_HOST=localhost:9999 \
    LFS_CONTENTPATH=/lfs LFS_ADMINUSER=admin LFS_ADMINPASS=admin

CMD lfs-test-server
