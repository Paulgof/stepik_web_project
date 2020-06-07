sudo ln -sf /home/box/web/etc/nginx.conf /etc/nginx/sites-enabled/site.conf
sudo rm /etc/nginx/sites-enabled/default
sudo ln -sf /home/box/web/etc/gunicorn.conf.py /etc/gunicorn.d/site.conf.py
sudo /etc/init.d/nginx restart

sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update && sudo apt install python3.6
sudo rm /usr/bin/python3
sudo ln -sf /usr/bin/python3.6 /usr/bin/python3
sudo rm /usr/bin/pydoc3
sudo ln -sf /usr/bin/pydoc3.6 /usr/bin/pydoc3

sudo wget https://bootstrap.pypa.io/ez_setup.py -O - | sudo python3
sudo pip3 install --force-reinstall setuptools

sudo pip3 install django==2.1
sudo pip3 install gunicorn==19.5

gunicorn -b "0.0.0.0:8080" hello:entrance -D
gunicorn -b "0.0.0.0:8000" ask.wsgi:application --chdir ./ask -D
