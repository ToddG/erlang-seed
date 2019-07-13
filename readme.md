# erlang-seed
Seed application template for erlang application with monitoring, prometheus and grafana.

## usage

    $ make help
    # -----------------------------------------------------------------------------
    # Targets:
    #
    #	clean 					: rm -rf ./out
    #	help 					: show this message
    #	gen PROJECTNAME=proj APPNAME=foo	: generate project in ./out/PROJECTNAME
    #
    # end.
    # -----------------------------------------------------------------------------

### example

    $ make clean
    $ make gen

This will create the application named 'foo' and generate all the scaffolding
for docker, monitoring, etc. and spin up the containers.

Take a look at the app metrics being served by mprom:

    $ curl http://localhost:4444/metrics

Then take a look at the prometheus server that is aggregating those metrics. 
It's easier to see this in a browser at: 

    http://localhost:9090/targets.

Finally, take a look at the grafana charts at: 

    http://localhost:3000.

Remember the grafana login is 'admin/admin'.

To shutdown the cluster:

    $ cd proj/foo
    $ make cstop

To restart the cluster:

    $ cd proj/foo
    $ make cstart

To tail the cluster logs:

    $ cd proj/foo
    $ make tail

## resources

### monitoring

For details on the monitoring and docker infrastructure:
* http://zwrob.com/posts 
* https://github.com/ToddG/monitor/releases/tag/v0.1.0

For details on the erlang app that provides prometheus metrics:
* github.com/toddg/mprom 

### erlang/rebar3
* https://www.rebar3.org/docs/getting-started

### templates
* https://github.com/tests-always-included/mo
