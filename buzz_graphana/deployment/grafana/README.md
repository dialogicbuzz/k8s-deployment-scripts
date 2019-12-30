grafana username and password are both admin by default

For anonymous access:	deployment.yaml.anonymous
For basic username and password login:	deployment.yaml.login
For auth proxy:	deployment.yaml.proxy

The current deployment.yaml is for anonymous.

Replace deployment.yaml with the one you want to use before deployment.

Grafana dashboard configuration files are in dashboard/ folder. You may update existing dashboards or add new dashboard here.

Grafana datasources are defined in datasources/ folder. Before you run grafana at the first time, you need to run read_db_conf.sh to set database connection parameters. 
