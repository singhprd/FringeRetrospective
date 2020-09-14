https://gorails.com/deploy/ubuntu/18.04
https://www.digitalocean.com/community/tutorials/how-to-deploy-a-rails-app-with-passenger-and-nginx-on-ubuntu-14-04
https://gorails.com/guides/free-ssl-with-rails-and-nginx-using-let-s-encrypt

edinfringe.co.uk

sudo /home/deploy/.local/share/letsencrypt/bin/letsencrypt certonly --webroot --webroot-path /home/deploy/myapp/current/public --renew-by-default --email peter@edinfringe.co.uk --text --agree-tos -d edinfringe.co.uk -d www.edinfringe.co.uk

  
edinfringe.co.uk