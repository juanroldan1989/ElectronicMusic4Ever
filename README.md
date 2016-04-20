<div align="left">
  <a href="https://github.com/juanroldan1989/electronic-music"><img width="350" src="https://github.com/juanroldan1989/electronic-music/raw/master/public/images/background_logo.jpg" alt="electronic music logo" /></a>
</div>

# Electronic Music

### An open-source platform to display data from creative facebook pages

##### Facebook page took as example: [Electronic Music 4 Ever](https://www.facebook.com/www.tranceforever.com.ar)

[![Code Climate](https://codeclimate.com/github/juanroldan1989/electronic-music/badges/gpa.svg?branch=master)](https://codeclimate.com/github/juanroldan1989/electronic-music)
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

Get FacebookPage's Token from: https://developers.facebook.com/tools/accesstoken

Get FacebookPage's ID as explained here: https://www.facebook.com/help/community/question/?id=378910098941520

Set values inside `application.yml` file:

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

### 2. Page structure 

* Currently there are 4 main sections: About, News, Gallery and Contact.
* News and Gallery sections retrieve live data from Facebook page.


### 3. Q&A

Questions or problems? Please post them on the [issue tracker](https://github.com/juanroldan1989/electronic-music/issues). You can contribute changes by forking the project and submitting a pull request. You can ensure the tests are passing by running `rspec spec`.


### 4. Live app

http://electronic-music.herokuapp.com/
