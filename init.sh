sudo ln -sf /home/box/web/etc/nginx.conf /etc/nginx/sites-enabled/site.conf
sudo rm /etc/nginx/sites-enabled/default
sudo ln -sf /home/box/web/etc/gunicorn.conf.py /etc/gunicorn.d/site.conf.py
gunicorn -c site.conf.py hello:entrance
sudo /etc/init.d/nginx restart
