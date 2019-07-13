# ubuntu-rebar includes erlang
FROM envirosoftwaresolutions/ubuntu-rebar:0.0.9 as builder

# set working directory
RUN mkdir -p /build
WORKDIR /build

# copy erlang source to /build
COPY {{APPNAME}} {{APPNAME}}

# build
WORKDIR {{APPNAME}} 
RUN make package

# install onto base ubuntu image, no rebar, no erlang, use everything
# from the release tar only
FROM envirosoftwaresolutions/ubuntu-tools:0.0.9
RUN mkdir -p /app
WORKDIR /app
COPY --from=builder /build/{{APPNAME}}/_build/prod/rel/{{APPNAME}}/{{APPNAME}}-0.1.0.tar.gz .
RUN tar -zxvf {{APPNAME}}-0.1.0.tar.gz

# serving metrics on port  
EXPOSE 4444

# launch application via an escript
ENTRYPOINT ["/bin/bash", "-l", "-c", "./bin/{{APPNAME}} foreground"]
