# Project description

**cph-flights** is a  Rails application which parsers departure flights from the [CPH website](https://www.cph.dk/en/flight-info/departures1/) and allows the user to filter the flight data.

You can read more about the project requirements [here](https://github.com/randome/cph-flights/blob/master/ASSIGNMENT.md).
# Techonology

**Rails 4.2.5**

> Since this is a technology stack I've worked most recently and I beleive Rails is a very good fit for small prototype project like this one.

**ReactJS 15.0.2**
via `react-rails` gem

> Since the requirement was to create a JavaScript based frontend I choose React since like Rails its what I've been working mostly recently and it does not lock you down in a framework since it's just a "view" and should be easy to replace it or grown with it and introduce something like flux / redux if needed.

**Bootstrap CSS**

> One of the tradeoffs I made was to get up and running fast so I just used a bootstrap framework with no design changes, I trust a designer/frontender would usually be invloved to polish up the design.

# Local project setup

Since there is no database behing this applicaiton, project setup should be simple

- `> git clone https://github.com/randome/cph-flights.git` to clone the repository
- `> bundle install` to install all the gems and dependencies
- `> bundle exec rspec` to run all the tests
- `> rails s` to start a rails server

vist [http://localhost:3000](http://localhost:3000)

## Requirements

`Ruby 2.3.0`

# How to evaluate this project

Since this is hosted on github a good startiing point would be [Closed PullRequest](https://github.com/randome/cph-flights/pulls?q=is%3Apr+is%3Aclosed) section to get a feeling for how the code evolved over time, I also made an effort to create good commit messages which contain more information on _why_ some changes were introduced.

I think that's important specifically since I'm assuming that this project is meant to be handed over to a client and other developers should have an easy way to get started and understand the changes.

This is how I would work on real projects.

---

# Tradeoffs

Since every software project will have some tradeoffs, in this particualar case I chose to keep the UI as simple as possible. (Current there is no styling applied)

# Notes

The application is split into two main parts, the API which is available for the frontend part for the end user so they can easily search and filter flights.

Frontend is build with ReactJS for the views and plain JS to glue everything together.

No module loader was used like browserify since the project was pretty simple, if it grew it would be smart to think about adding a module loader or something like flux / redux to easily reason with the arhitecture.


# Screenshots

![App Screenshot](/screenshots/cph-flights.jpg?raw=true)

# Hosting

Application is hosted on herokus free tier at https://cph-flights.herokuapp.com/.

