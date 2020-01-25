[![Build Status](https://travis-ci.org/piousbox/microsites3_api.svg?branch=master)](https://travis-ci.org/piousbox/microsites3_api)

# Intro

This is a CMS - a content management system to serve as a backend for a travel guide.

Putting this in your bash_profile: `alias be='bundle exec '` allows you to save a few keystrokes. `be` in docs of this project means `bundle exec`.

We are on branch `master`. However, the alphanumeric-latest branch is also most recent, currently 0.1.8.

This has been developed on unix, specifically OS X and Ubuntu. If you must use another OS and it actually works - let me know, so I can put your steps in the instructions!

Let me know if there are any problems during the bundling! Most of the problems on this step is lack of native extensions, which you can easily google to address. Any other non-trivial steps you have to take - please put a file in the docs/ folder describing what you did.

It's best if you fork every repository used in this project. This way, if you need to make a change, you can pull request your changes to base. You can do something like `export GITHUB_USERNAME=<your-github-username>` because in this document I refer to `$GITHUB_USERNAME`.

Fork these repos:
* https://github.com/piousbox/microsites3
* https://github.com/piousbox/ish_models
* https://github.com/piousbox/ish_manager
* https://github.com/piousbox/ishapi

# Develop 

First, clone the main repo:
```
  mkdir -p ~/projects/ruby ; cd ~/projects/ruby ; git clone git@github.com:$GIT_USERNAME/microsites3.git
```

Then, get access files from me.

Then, setup local bundle overrides:
```
cd ~/projects/ruby/microsites3

git clone git@github.com:$GIT_USERNAME/ish_models.git
git clone git@github.com:$GIT_USERNAME/ishapi.git
git clone git@github.com:$GIT_USERNAME/ish_manager.git

bundle config local.ish_models ~/projects/ruby/microsites3/ish_models
bundle config local.ishapi ~/projects/ruby/microsites3/ishapi
bundle config local.ish_manager ~/projects/ruby/microsites3/ish_manager
```

Verify that overrides make sense: `cat ~/.bundle/config`

You should see something like:
<pre>
---
BUNDLE_LOCAL__ISH_MODELS: "~/projects/ruby/microsites3/ish_models"
BUNDLE_LOCAL__ISHAPI: "~/projects/ruby/microsites3/ishapi"
BUNDLE_LOCAL__ISH_MANAGER: "~/projects/ruby/microsites3/ish_manager"
</pre>

Then: <pre>bundle install --path vendor/bundle</pre>

Then: <pre>bundle exec rails server --port 3001</pre>

We are standardizing on port 3001 right now. Then go to http://localhost:3001 and you should see the login screen.

<pre>
 username: test@gmail.com
 password: test1234
</pre>

That should log you in. You are ready to use the application.

# Test 
Placeholder - tests are pretty elaborate, let's skip them in the initial setup

# Deploy 
Deploying is done by a separate team
