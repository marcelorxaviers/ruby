### Requirements
#### Ruby / Rails Setup
In order to run the application you have to install: `Ruby 2.4.0, Rails 5.1.3 and Bundler 1.15.4`

#### Domain Setup
As the project needs to handle more than one domain, you have to configure your computer to do it. If you are at a Debian based distro you can do it at **/etc/hosts** adding the lines:
```
127.0.0.1 written.rwdev.io
127.0.0.1 ios.rwdev.io
127.0.0.1 written.rwdev.io
127.0.0.1 videos.rwdev.io

```

Your file should look similar to the following:
```
127.0.0.1 localhost
127.0.1.1 zen
127.0.0.1 written.rwdev.io
127.0.0.1 ios.rwdev.io
127.0.0.1 written.rwdev.io
127.0.0.1 videos.rwdev.io

# The following lines are desirable for IPv6 capable hosts
::1     ip6-localhost ip6-loopback
fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
```

#### Project Setup
On a shell console at the project's main folder run the following commands:
```
$ ➜ bundle install
$ ➜ bundle exec rails db:create db:migrate db:seed
$ ➜ bundle exec rspec -fd
```

The last line of the output should be `8 examples, 0 failures`. We are ready to go!

### Running the project
On a shell console at the project's main folder run the following command:
```
$ ➜ sudo bundle exec rails server -p 80
```

Type in your password and you'll have the project running.

### Setup and basic functionalities
Follow [this link](https://drive.google.com/open?id=0B82wTkj5ypa0NUM2V0RLY3dqeTQ) to watch a screenrecord where I do run the setup and show the project running and its features.