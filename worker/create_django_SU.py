import django
#django.setup()
from django.contrib.auth.models import User
try:
    User.objects.create_superuser('marcus', 'mandealista@gmail.com', 'senha')
except Exception:
    pass