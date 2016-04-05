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

## EC2 Setup

You'll need to create an IAM user / keypair. I'm not sure what permissions are
necessary, so I gave my user the "AmazonEC2FullAccess" policy (directly, not
via group membership). You'll also need to update your VPC ID. For some reason,
Docker Machine won't use the default.

Another occassional issue is that you need to check that you have a subnet id
in the zone you're using. Docker Machine uses zone 'a' by default, but one of
my accounts only had zones 'b' and 'c' configured for my region!

Lastly, you'll need to open up the docker-machine security group to allow
connections to port 8080. This is probably a bit redundant with the firewalling
that comes with Docker. I do this "by hand" from the EC2 console.
