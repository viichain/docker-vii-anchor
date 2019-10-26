# Ports

| Port  | Service      | Description          |
|-------|--------------|----------------------|
| 5432  | postgresql   | database access port |
| 8000  | horizon      | main http port       |
| 11625 | vii-core     | peer node port       |
| 11626 | vii-core     | main http port       |

# Build
$ docker build -it vii/vii-anchor .

# Run
$ docker run -it -p "8000:8000" -p "11626:11626" -p "11625:11625" --name vii vii/vii-anchor

# Config
## Core
core/etc/vii-core.cfg
## Horizon
common/horizon/etc/vii-horizon.env
