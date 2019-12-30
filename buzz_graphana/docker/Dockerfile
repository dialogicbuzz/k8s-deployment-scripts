FROM grafana/grafana

LABEL "about"="This a grafana docker image wrapper to include pie chart panel plugin"

RUN grafana-cli plugins install grafana-piechart-panel
RUN reboot -n
