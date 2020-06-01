sudo ln -sf /home/box/web/etc/nginx.conf /etc/nginx/sites-enabled/site.conf
sudo rm /etc/nginx/sites-enabled/default
sudo ln -sf /home/box/web/etc/gunicorn.conf.py /etc/gunicorn.d/site.conf.py
sudo /etc/init.d/nginx restart
gunicorn -b "0.0.0.0:8080" hello:entrance -D
gunicorn -b "0.0.0.0:8000" ask.wsgi:application --chdir ./ask -D
