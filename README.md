# ReverseProxy
Nginx Reverse Proxy for Production Server

The Reverse Proxy runs as an Nginx server within a docker container. When a new application is set up and given a port, an endpoint should be configured for it.

### Adding an Endpoint

To add an endpoint to the Reverse Proxy a few steps have to be taken

#### Adding a Proxy Pass

Add the new endpoint as a entry in the [config file](https://github.com/Capping-WAR/ReverseProxy/blob/master/nginx.conf)

Example: 
```conf
server {
    listen 80;
    
    location / {
        proxy_pass http://10.11.17.26:30080/;
    }
}
```

### Redeploy the Reverse Proxy

On the server take down the running proxy and remove its image from the server. Next after pulling the latest changes from GitHub, in the root directory of this repo run:

```
docker-compose up
```