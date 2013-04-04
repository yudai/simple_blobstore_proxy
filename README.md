Simple Blobstore Proxy
======================

How to use
----------

### Launch the process

```
mkdir -p /var/vmc/bosh/blob
bundle install
bundle exec ./bin/simple_blobstore_server
```

You can change the directory for file caching by editing config/simple_blobstore_server.yml.

To keep the process alive after exiting your terminal, try `nohup` command.

```
nohup bundle exec ./bin/simple_blobstore_server &
```

### Edit final.yml and private.yml

Edit configuration files in your cf-release directory.

* config/final.yml: Edit `blobstore`

```
blobstore:
  provider: simple
    options:
        endpoint: http://localhost:9999
```

* config/private.yml: Add the configuration below

```
---
blobstore:
  simple:
    user: admin
    password: admin
```

### Create final release

Execute the following command.

```
bosh create release --final
```

Missing blob files will be downloaded from the remote blobstore and newly added files will be posted to your proxy server.


License
-------

Apeche License Version 2.0

The original source code is written and distributed by VMware, inc under Apache License Version 2.0.
