# ReverseProxy
Apache Reverse Proxy for Production Server

The Reverse Proxy runs as an Apache2 server within a docker container. When a new application is set up and given a port, an endpoint should be configured for it.

## Adding an Endpoint

To add an endpoint to the Reverse Proxy a few steps have to be taken

### Adding a Proxy Pass

First head to [the site configuration file]() and add a Proxy at the bottom of the file before the `</VirtualHost>`.

Example Proxy Config:
```config
# War Docs

ProxyPass /docs http://war.marist.ai:3001
ProxyPassReverse /docs http://war.marist.ai:3001

<Location /docs/*>
 Order allow,deny
 Allow from all
</Location>
```

**Note: If the app needs to be available on https as well, add the same configurations to [the https site configuration file]()**

### Redeploy the Reverse Proxy

On the server take down the running proxy and remove its image from the server. Next after pulling the latest changes from GitHub, in the root directory of this repo run:

```
docker-compose up
```