#!/bin/bash

echo "Waiting for DBs..."

while ! nc -z $DB_HOST $DB_PORT; do
    sleep 1
done

echo "DB started"

#python manage.py flush --no-input
#python manage.py migrate
python manage.py shell -c "from django.contrib.auth import get_user_model; User = get_user_model(); User.objects.create_superuser('marcus', 'mandealista@gmail.com', 'senha')"
python manage.py migrate --noinput
exec python manage.py runserver 0.0.0.0:8001

#exec "$@"