FROM node:8.14.0-jessie
LABEL maintainer="Vishal Gupta <vishal.gupta@mindtree.com>"
LABEL vendor=Mindtree\ Incorporated \
      MT.AppName="TrainingApp" \
      MT.App.is-production="True" \
      MT.App.release-date="2018-18-10"
#==========================
#==========================
#RUN apt-get -y install cron
#ARG runenv=development
#ARG appname=calculator
RUN apt-get update -y && \
apt-get upgrade -y && \
apt-get dist-upgrade -y && \
apt-get install apt-utils -y
RUN apt-get install -y \
sudo \
build-essential \
nano \
wget
RUN export NODE_PATH=/usr/src/node_modules
WORKDIR /usr/src/app
COPY . .
#RUN npm install -g pm2 express
#RUN npm update -g && \
RUN npm install
# RUgit 
EXPOSE 3000
#================
# Set entry_point file executable.
#=================
RUN chmod 744 /usr/src/app/init.sh
#RUN ln -s usr/src/app/init.sh / # backwards compat
ENTRYPOINT ["/usr/src/app/init.sh"]
#CMD [$runenv, $appname, $PM2_SECRET_KEY, $PM2_PUBLIC_KEY, $PM2_APP_NAME]
#USER $username