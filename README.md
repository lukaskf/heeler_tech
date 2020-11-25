# <img src="app/assets/images/cattle-dog1.png" alt="Blue Heeler" width="100" height="100"/> Heeler Technologies (Coding Challenge) 

This was a project do demonstrate building a webapp with Ruby on Rails \
to display an event schedule from uploaded csv data. 

### Installation and Usage
#### Install / Run:
1) To clone this repo run `git clone https://github.com/lukaskf/heeler_tech.git`
2) This project was built using Ruby 2.6 and Rails 6.0, If you need ruby please see official documentation here: Ruby(https://www.ruby-lang.org/en/documentation/installation/) \
3) With Ruby installed you can then run `gem install rails`
4) To install dependencies run `bundle install`, this utilizes the Gemfile to install ruby dependencies. Follow this by `yarn install --check-files`. (This may take a while)
5) Database migration via `rails db:migrate`
6) To start the rails server run `rails server` and go to `localhost:3000` in your browser!

#### Rake Task to Import Data:
There are three models that data can be imported to: Technicians, Locations, and Workorders. To update data to be uploaded overwrite the data in the csv's found in `lib/assets/` \ 
(rake task has path/filenames hardcoded).

To import data for technicans, locations, and workorders in one command:
```
rake import_csv:import_technicians import_csv:import_locations import_csv:import_workorders
```

To import data for just one model:
```
rake import_csv:import_<model name>s
```

### Design & Approach
- Crawl, Walk, Then Run
    - When tackeling full-stack projects, and particularly with difficult problems and new technologies I find this to be the best approach to development. First crawl, get the basics down and \
    prototype your application or feature. Then walk, incrementally making improvements and refactoring until you finally run and achieve the functionality you set out to create.
- Back to Front Development
    - This project was built by first creating a working rails app, then creating the scaffolds for the models (full MVC pattern), rake task functionality, and finally building the front-end. 
- Table vs. Grid
    - At a first glance it seems that a standard table layout would fit the needs of this project. However, trying to create an elegant display with the ability to click on blank space and have\
    the available time between workorders returned would have been far too complicated. This led to using a CSS Grid instead, which allows for workorder blocks in the schedule to have various size in the y-direction, as well as being easily placed in the correct location on the x-axis. 
### Difficulties in Development
- DateTime Ruby Module
    - Ensuring the dates were being parsed correctly into the database via the rake task proved to be confusing. Additionally, it was misleading when the dates/times would display correclty \
    but performing operations on datetime objects would render unexpected results.
- Algorithm to display Workorder and Blankspace(Holder) Blocks in Front-end
    - This algorithm had to be refactored from first in a loop that iterated on time slots to iterating on technicians, and also involved many time calculations. 

### Future Improvements
- React (or similar JS Front-end Framework)
- Enhanced features:
    - Click on available slots to create workorders
    - Display schedule for multiple days
    - User accounts and login
    - Display data for variable number of technicians
- Rake task be passed argument for path/filename
- Testing
