# Zammad

This is a fork of the zammad repository, configured to my own needs. Changes include a docker based deployment, and integration with existing databse variables via environment.

Some changes are also made to be consistent with other ruby based applications.

## Deployment


docker run --name zammad-update --network host --rm -e DATABASE_PASSWORD=$DATABASE_PASSWORD -i -t 9389ced16e7b rails db:create
docker run --name zammad-update --network host --rm -e DATABASE_PASSWORD=$DATABASE_PASSWORD -i -t zammad rails db:migrate
docker run --name zammad-update --network host --rm -e DATABASE_PASSWORD=$DATABASE_PASSWORD -i -t zammad rails db:seedi

docker run --name zammad -p 8080:3000 -p 6042:6042 -d -e ZAMMAD_BIND_IP=0.0.0.0 -e DATABASE_PASSWORD=$DATABASE_PASSWORD -e DATABASE_HOST=172.17.0.1 -e DATABASE_USER=iptaas -e DATABASE_PORT=5432 -it zammad foreman start

