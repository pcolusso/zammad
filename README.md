# Zammad

This is a fork of the zammad repository, configured to my own needs. Changes include a docker based deployment, and integration with existing databse variables via environment.

Some changes are also made to be consistent with other ruby based applications.

## Deployment

docker run --name zammad-update --network host --rm -e DATABASE_PASSWORD=$DATABASE_PASSWORD -i -t 9389ced16e7b rails db:create
docker run --name zammad-update --network host --rm -e DATABASE_PASSWORD=$DATABASE_PASSWORD -i -t zammad rails db:migrate
docker run --name zammad-update --network host --rm -e DATABASE_PASSWORD=$DATABASE_PASSWORD -i -t zammad rails db:seed