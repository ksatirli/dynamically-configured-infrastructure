---
id: index
title: Consul
sidebar_label: Usage
---

## Accessing this service

The _Consul_ service is available via the included UI and the CLI.

## Using the UI

The browser-based UI for this service is available via [consul.container.shipyard.run](http://consul.container.shipyard.run:8500/ui/).

## Using the CLI

To use a locally available `consul` binary as a client, set the `CONSUL_HTTP_ADDR` environment variable:

```shell
export CONSUL_HTTP_ADDR=http://consul.container.shipyard.run:8500
```

The recommended approach to setting environment variables is to use [shipyard env](https://shipyard.run/docs/commands/env):

```shell
eval $(shipyard env)
```

This ensures that _all_ pre-defined environment variables are set.

## Using the Web CLI

<Terminal target="consul.container.shipyard.run" shell="/bin/sh" workdir="/" user="root" expanded />

<noscript>To use the [Shipyard Terminal](https://github.com/shipyard-run/terminal-component), ensure JavaScript is enabled.</noscript>

## Running commands inside the service container

To run commands directly in the Consul service container, use Shipyard's [exec](https://shipyard.run/docs/commands/exec) feature:

```shell
shipyard exec container.consul
```
