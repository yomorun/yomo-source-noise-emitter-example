# yomo emitter for noise-example

This is part of the [example-noise](https://github.com/yomorun/example-noise), which describes how to write a [**noise-emitter**](https://github.com/yomorun/yomo-source-noise-emitter-example) to produce data for [noise-source](https://github.com/yomorun/yomo-source-noise-example).

![arch1.png](https://github.com/yomorun/example-noise/raw/main/docs/arch1.png?raw=true)

## 🚀 Getting Started

If you don't want to buy the IoT device in the picture above, you can use emitter to generate data.

### Run the emitter

```bash
YOMO_SOURCE_MQTT_BROKER_ADDR=tcp://localhost:1883 \
YOMO_SOURCE_MQTT_PUB_TOPIC=NOISE \
YOMO_SOURCE_MQTT_PUB_INTERVAL=500 \
go run main.go
```

- YOMO_SOURCE_MQTT_BROKER_ADDR: service-address of [noise-source](https://github.com/yomorun/yomo-source-noise-example).
- YOMO_SOURCE_MQTT_PUB_TOPIC: simulate the TOPIC used by MQTT.
- YOMO_SOURCE_MQTT_PUB_INTERVAL: frequency of production data. Unit is milliseconds.

You will see the following message:

```text
2021/04/29 14:49:45 Broker Addresses:  [tcp://localhost:1883]
2021/04/29 14:49:45 [client connect state] IsConnected:true, IsConnectionOpen:true
2021-04-29 14:49:45: Publish counter=1, topic=NOISE, payload={"noise":1}
2021-04-29 14:49:46: Publish counter=2, topic=NOISE, payload={"noise":2}
2021-04-29 14:49:46: Publish counter=3, topic=NOISE, payload={"noise":3}
```

## Container

### Docker Image

The case provides [Dockefile](https://github.com/yomorun/yomo-source-noise-emitter-example/blob/main/Dockerfile) files for packaging into images.

Also, you can get the official packaged image ([noise-emitter](https://hub.docker.com/repository/docker/yomorun/noise-emitter)) from the mirror repository.

```
docker pull yomorun/noise-emitter
```

### Docker run

You can run the service with the following command:

```
docker run --rm --name noise-emitter \
  -e YOMO_SOURCE_MQTT_BROKER_ADDR=tcp://{YOUR-NOISE-SOURCE-ADDR}:1883 \
  -e YOMO_SOURCE_MQTT_PUB_INTERVAL=500 \
  yomorun/noise-emitter:latest
```

