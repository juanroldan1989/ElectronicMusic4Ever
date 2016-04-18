<div align="left">
  <a href="https://github.com/juanroldan1989/electronic-music"><img width="500" src="https://github.com/juanroldan1989/electronic-music/raw/master/public/images/background_logo.jpg" alt="electronic music logo" /></a>
</div>

# Electronic Music

### An open-source platform to display data from creative facebook pages

[![Code Climate](https://codeclimate.com/github/juanroldan1989/electronic-music/badges/gpa.svg)](https://codeclimate.com/github/juanroldan1989/electronic-music)
[![Build Status](https://travis-ci.org/juanroldan1989/electronic-music.svg?branch=master)](https://travis-ci.org/juanroldan1989/electronic-music)
[![Coverage Status](https://coveralls.io/repos/github/juanroldan1989/electronic-music/badge.svg?branch=master)](https://coveralls.io/github/juanroldan1989/electronic-music?branch=master)

### 1. Development

Clone repository:

```
git clone git@github.com:juanroldan1989/electronic-music.git
```

Install gems:

```
bundle install
```

Get Facebook Page Token from: https://developers.facebook.com/tools/accesstoken

Set token's value inside `application.yml` file:

```
cp config/application.sample.yml config/application.yml
```

Validate test suite:

```
rspec spec
```

Launch server:

```
foreman start
```

### 2. Q&A

Questions or problems? Please post them on the [issue tracker](https://github.com/juanroldan1989/my-budget-app/issues). You can contribute changes by forking the project and submitting a pull request. You can ensure the tests are passing by running `rspec spec`.


### 3. Live app

http://electronic-music.herokuapp.com/
