sudo ln -sf /home/box/web/etc/nginx.conf /etc/nginx/sites-enabled/site.conf
sudo rm /etc/nginx/sites-enabled/default
sudo ln -sf /home/box/web/etc/gunicorn.conf.py /etc/gunicorn.d/site.conf.py
gunicorn -c /etc/gunicorn.d/site.conf.py hello:entrance -D
sudo /etc/init.d/nginx restart
