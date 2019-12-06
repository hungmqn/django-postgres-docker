
### Installation
0. Setup environment
```env
POSTGRES_DB=POSTGRES_DB
POSTGRES_USER=POSTGRES_USER
POSTGRES_PASSWORD=POSTGRES_PASSWORD

DB_ENGINE=django.db.backends.postgresql (prefer on django docs for other db)
DB_NAME=DB_NAME
DB_USER=DB_USER
DB_PWD=DB_PWD
DB_HOST=DB_HOST (ip or alias of docker-compose container name)
DB_PORT=DB_PORT

DJANGO_SECRET_KEY=<your_django_secret_key>
```
1. Create project.
```bash
docker-compose run --rm server django-admin startproject server .
```
2. In `src/server/server/settings.py`, replace `SECRET_KEY = ...` and `DATABASE = {...}` by these:
```python
SECRET_KEY = os.environ['DJANGO_SECRET_KEY']
...
DATABASES = {
    'default': {
        'ENGINE': os.environ['DB_ENGINE'],
        'NAME': os.environ['DB_NAME'],
        'USER': os.environ['DB_USER'],
        'PASSWORD': os.environ['DB_PWD'],
        'HOST': os.environ['DB_HOST'],
        'PORT': os.environ['DB_PORT'],
    }
}
```
3. Start container.
```bash
# detached mode
docker-compose up -d
# or
docker-compose up
```
4. Check if the django server started. Go to `http://localhost:8000/` or `http://127.0.0.1:8000/`.
### Useful commands
0. General command.
```bash
docker-compose run --rm server python manage.py ......
```
1. Migration. (Should run after installation and models updating)
```bash
docker-compose run --rm server python manage.py migrate
```
2. Create super user. (Can only be run after migration)
```bash
docker-compose run --rm server python manage.py createsuperuser
```
Go to `/admin' to login.
3. Create apps.
```bash
docker-compose run --rm server python manage.py startapp <app_name>
```
4. Migrate app models.
```bash
docker-compose run --rm server python manage.py makemigrations <app_name>
```
