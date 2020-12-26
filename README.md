# Node Red Docker Postgre

A Docker container that runs [NodeRed](https://nodered.org) on port `5000` by default.

## Installation

Just clone this project

```git clone https://github.com/CypherpunkSamurai/node-red-pg```

Then use Docker to run it

```cd node-red-pg```

```docker build -t node-red-pg```

```docker run --name node-red-pg```

## Configuration
To configure custom port you can set `PORT` env var.

To configure username and password set `NODE_RED_USERNAME` and `NODE_RED_PASSWORD`.

To configure Postgresql db url (required) set `DATABASE_URL` env var.

You can include it in a .env file or use docker to set env during deploy.

## Credits

[Node Red](https://nodered.org/) Team for Node Red

[WeekendWarrior1](https://github.com/WeekendWarrior1) for his postgresql [npm package](https://github.com/WeekendWarrior1/node-red-contrib-storagemodule-postgres)

[Joeartsea](https://github.com/joeartsea) for his Heroku implementation and inspiration to create a Docker image.

[Me](https://github.com/CypherpunkSamurai) for putting the effort into bringing this project together.