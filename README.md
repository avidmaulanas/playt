## Playt
Playt is an application built on Ruby on Rails. It can add and playing video from Youtube.

This README is intended to help get you started. Definitely how to use and what functionality it has, etc! 

### Running Playt Locally
The first, clone repo Playt
```
$ git clone git@github.com:avidmaulanas/playt.git
```

Run the bundle command to install it.
```
$ cd playt
$ bundle install
```

Add Youtube API key
```
$ mv .env.example .env
```

Adding your Youtube API key in file `.env`, such as below
```
YOUTUBE_API_KEY=your_api_key
```
Database Adapter
* The environtment development we use adapter `sqlite`, and for production use adapter `posgresql`

Prepare database
```
$ rake db:create
$ rake db:migrate
```

Start server
```
$ rails s
```

Open in your browser [http:localhost:3000](http:localhost:3000)


### Request a Feature?

You can request a feature with issue page and use label enhancement. We will review and make it work if possible.

### How to Contribute

* Fork the project
* Writing new feature or fixing something
* Perform a pull request in GitHub's web interface.
