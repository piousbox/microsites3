[![Build Status](https://travis-ci.org/piousbox/microsites3_api.svg?branch=master)](https://travis-ci.org/piousbox/microsites3_api)

= Develop =
 alias be='bundle exec '

We are on branch `master`. However, the alphanumeric-latest branch is also most recent, currently 0.1.8.

This has been developed on *nix, specifically OS X and Ubuntu. If you must use another OS and it actually works - let me know, so I can put your steps in the instructions!

* clone the repo, then:
 bundle install --path vendor/bundle

Let me know if there are any problems during the bundling! Most of the problems on this step is lack of native extensions, which you can easily google to address. Any other non-trivial steps you have to take - please put a file in the docs/ folder describing what you did. Then:

* get access files from me, then:
 bundle exec rails server --port 3001

We are standardizing on port 3001 right now. Then go to http://localhost:3001 and you should see the login screen.

 username: test@gmail.com
 password: test1234

That should log you in. You are ready to use the application.

= Test =
Placeholder - tests are pretty elaborate, let's skip them in the initial setup

= Deploy =
Deploying is done by a separate team
