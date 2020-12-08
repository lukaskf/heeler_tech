FROM ruby:2.6.3
MAINTAINER lukaskf@gmail.com

#Install Dependencies and Create App Directory
RUN apt-get update && apt-get install -y npm && npm install -g yarn

RUN mkdir -p /var/app
COPY . /var/app
WORKDIR /var/app

RUN bundle install
RUN yarn install --check-files

#Migrate DB and Populate via Rake Task
CMD rails db:migrate
CMD rake import_csv:import_technicians import_csv:import_locations import_csv:import_workorders

#Run Rails Server!
CMD rails s -b 0.0.0.0

