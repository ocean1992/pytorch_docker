# pytorch_docker
My docker image file of pytorch

I use pytorch docker image from [docker hub](https://hub.docker.com/r/pytorch/pytorch), tag is :**0.4.1-cuda9-cudnn7-devel**. Once I updated my code (a small update, just code refine, not related to pytorch, i think) and run. Strange Errors:
```
*** Error in `/opt/conda/bin/python': free(): invalid pointer: 0x0000556236118dd8 ***
======= Backtrace: =========
/lib/x86_64-linux-gnu/libc.so.6(+0x777e5)[0x7f2d88e757e5]
/lib/x86_64-linux-gnu/libc.so.6(+0x8037a)[0x7f2d88e7e37a]
/lib/x86_64-linux-gnu/libc.so.6(cfree+0x4c)[0x7f2d88e8253c]
```

The errors have been discussed in github in pytorch issues including ([#2314](https://github.com/pytorch/pytorch/issues/2314), [#2339](https://github.com/pytorch/pytorch/issues/2339).

Someone provides a [solution](https://github.com/pytorch/pytorch/issues/2314#issuecomment-320903258):
```
sudo apt-get install libtcmalloc-minimal4
export LD_PRELOAD="/usr/lib/libtcmalloc_minimal.so.4"
```
However when i add these two lines in my docker image file. New errors appear:
```
[libprotobuf FATAL ./google/protobuf/map_field.h:388] Protocol Buffer map usage error:
MapKey::type MapKey is not initialized. Call set methods to initialize MapKey.
terminate called after throwing an instance of 'google::protobuf::FatalException'
  what():  Protocol Buffer map usage error:
MapKey::type MapKey is not initialized. Call set methods to initialize MapKey.
```
Another one [says](https://github.com/pytorch/pytorch/issues/2314#issuecomment-348861155) install pytorch with **pip** can fix this bug (official pytorch docker image install using **conda**)

I write this docker image using pip to install torch and it works!

Just share and provide a way to fix this bug.
