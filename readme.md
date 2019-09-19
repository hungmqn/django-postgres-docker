### Prerequisites
Docker and that's all!

### Installation

1. Run this command
```bash
    ./bin/web/install django_project_name
```
2. You should see generated source of the app in `/src`.
```src
/bin
    ...
/src
    /db
    /django_project_name
        __init__.py
        settings.py
        urls.py
        wsgi.py
    manage.py
    requirement.txt
```
3. In `src/django_project_name/settings.py`, replacce `DATABASE = {...}` by this object. This will be your database connection.
```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': 'postgres',
        'USER': 'postgres',
        'HOST': 'db',
        'PORT': 5432,
    }
}
```
4. Run this command from project root to start django docker container.
```bash
# detached mode
docker-compose up -d
# or
docker-compose up
```
5. Go to `http://localhost:8000/` or `http://127.0.0.1:8000/`. You should see `Congratulations!` page, with a rocket taking off. It worked!

### Usage
For the first time, after initializing and start the project with docker:
1. Run this command to do data migration with the app.
```bash
./bin/web/migrate
```
2. Create super admin by using this command.
```bash
./bin/web/createsuperuser
```
You can go to `http://localhost:8000/admin` and use the created account.
If you want quick access to project files in container, you can use:
```
./bin/web/cmd <your_command>
# eg: the command is to list everything in current working directory from container.
./bin/web/cmd ls
db django_project_name manage.py requirement.txt
```
Please read `./bin/web/cmd` for more information.

Quick migrate
```bash
./bin/web/migrate
# This will run below command in container
python manage.py migrate
```

### Database
With the settings at `Installation`. The database connection from the host should be:
```
Host: localhost
Port: 5432
Database: postgres
User: postgres
```

### More
Any permission denied, run this command.
```bash
chmode +x <file>
# eg: give permission to run command from install file
chmode +x ./bin/web/install
```
### Useful links
`<recommendation>` https://docs.docker.com/compose/django/
`<documentation>` https://docs.djangoproject.com/