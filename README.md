# README

I don't know how you got here, but I doubt you'll find anything useful to you here.

This is a website that I hacked together for my ski club, in order to ease selling stuff between members.

The code is not really meant to be any of the following :
  - Clean and following best practices
  - Properly covered by tests
  - Meant to be reusable by anyone else
  - Easily translatable
  - Easily readable / extendable

Feel however free to use it !

## License

This website is licensed under AGPLv3+

## Local dev

Use `rbenv` to setup local env, install postgres db

```
rbenv install
gem install bundler
bin/bundler install
```

Useful commands :

* `bin/rails server` : start the local server
* `bin/rails console` : open a rails console
* `bin/bundle exec annotate --models` : re-annotate model files after a db structure change

## Updating dependencies

* If you want to update the bundler version too (may be needed for deployment), first `rm Gemflie.lock`
* `bin/bundle update`

## Deploying

Deployment is made with ansible (min version 2.8).

The current way to do it is quite ugly (locally build a docker image, and start it in the host network namespace.

Create an inventory file, then :
```
ansible-playbook -i your.inventory playbook.yml
```
