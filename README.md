# mqta

This is a small tool for visualizing what's flowing on an AMQP exchange
(e.g RabbitMQ). It will output to stdout.

## Installation

    $ gem install mqta

## Usage

You need to specify ENV vars with the credentials for accessing the AMQP exchange.

```
EXCHANGE=exchange-name HOST=host USER=user VHOST=vhost PASSWORD=password mqta"
```

where `EXCHANGE` is the name of the exchange you want to see on the screen.

This will block and show every message that the exchange receives, by creating a
temporary queue bound to that exchange.

#### Tips

**Alias per project:** if you're on a particular project, define an alias:

```
alias mqta_my_project="HOST=host USER=user VHOST=vhost PASSWORD=password mqta"
```

Then call your alias with `EXCHANGE=my-project mqta_my_project`.

**Format JSON Payloads:** if the exchange gets JSON messages, you can format
them with `jq` (e.g `brew install jq` on the MacOS).

```
EXCHANGE=my-project mqta_my_project | jq '.some-key | .[] | { key: .some-other-key }'
```

This will pipe every message into `jq`. This tool will allow you to select
exactly what you need without having to explode your terminal with so much text.

**First N chars:** if you don't want to see all the data and don't care about
JSON, you can limit the number of chars per line with
`EXCHANGE=my-project mqta_my_project | cut -c 1-160` (replace `160` with the
number of chars you want).

## Development

It's basically a bin script at `bin/mqta`, so there's not much to see here for
now. If the features set grows, I'll organize it in classes.
