# ODK-composed

This is meant to be a simple-to-deploy ODK server. Dav's current use-case is
for a small set of users (~20 concurrent) deployed on a t2.micro instance.

`docker-mysql-minimal` is a git submodule, to facilitate collaboration with
that project. So prior to using this, do:

    $ git submodule init
    $ git submodule update

Assuming you have configured a docker environment (I use Docker Machine to
provision an Amazon EC2 t2.micro instance), the following should provision a
machine with an admin user with your Unix username:

    $ docker-compose up

Many thanks to @staff0rd and @kharatsa who did much of the heavy lifting here.
