<p align="center">
  <a href="https://blog.discursus.io">
    <img src="images/discursus_logo_white.png" width="90px" alt="discursus" />
  </a>
</p>
<p align="center">
    <a href="https://blog.discursus.io/">Blog</a> |
    <a href="https://twitter.com/discursus_io">Twitter</a>
    <br /><br />
    <a href="https://github.com/discursus-io/discursus_core/releases">
        <img src="https://img.shields.io/github/release/discursus-io/discursus_core" alt="Latest release" />
    </a>
    <a href="https://github.com/discursus-io/discursus_core/issues">
        <img src="https://img.shields.io/github/issues/discursus-io/discursus_core" alt="Open issues" />
    </a>
    <a href="https://github.com/discursus-io/discursus_core/contributors/">
        <img src="https://img.shields.io/github/contributors/discursus-io/discursus_core" alt="Contributors" />
    </a>
</p>

# What is the discursus core platform?

Protest movements are powerful dynamics between citzens and institutions. Behind the physical manifestation of protests are discourses that morphes. They are incubators of ideas. Like viruses that mutate, spread and can change our collective ethos.

Protest events are important to understand, as they confronts us as a society and leads to healthier and more vibrant democracies. The problem is that they are hard to observe, study and analyse.

__The discursus project is an open source data platform__ that mines, shapes and exposes the digital artifacts of protests, their discourses and the actors that influence social reforms.

[For a full introduction, read here](https://www.olivierdupuis.com/introducing-discursus-io/)

&nbsp;

# Architecture

<img src="images/discursus_core_stack.png" width="750px" alt="discursus" />

Here are the main components of the discursus core architecture:

- A miner that sources events from the GDELT project (https://www.gdeltproject.org/) and saves it to AWS S3.
- A dbt project that creates a data warehouse which exposes protest events.
- A Dagster orchestrator that schedules the mining and transformation pipelines.


&nbsp;

# ERD

The following entities are exposed as the final output of our architecture.

<img src="images/discursus_core_erd.png" width="650px" alt="discursus" />


&nbsp;

# Installation
Spinning up your own discursus instance still isn't a breeze. But we know how important it is and are working on making our architecture and documentation more robust to that effect.

For now, to spin up an instance of discursus Core, you will first need to have your own external service accounts in place:
- An AWS S3 bucket to hold the events, articles and enhancements.
- An AWS ec2 instance to run discursus.
- A Snowflake account to stage data from S3, perform transformations of data and expose entities.

On Snowflake, you will need to create a few objects prior to running your instance:
- Source tables to stage the mined events.
- Snowpipes to move data from S3 to your source tables.
- File formats for Snowflake to read the source S3 csv files properly.

Once you have all those in place, you can fork the discursus Core repo.

Only thing left is to configure your instance:
- Rename the `Dockerfile_app.REPLACE` file to `Dockerfile_app`.
- Change the values of environment variables within the `Dockerfile_app` file.
- Make any necessary changes to `docker-compose`
- To run the Docker stack locally: `docker compose -p "discursus-data-platform" --file docker-compose.yml up --build`
- Visit Dagster's app: `http://127.0.0.1:3000/`

&nbsp;

# Contributing

There are many ways you can contribute and help discursus core. Here a few ones:

* Star this repo, subscribe to our [blog](https://blog.discursus.io/) and follow us on [LinkedIn](https://www.linkedin.com/company/76981202/admin/).
* Fork this repo and run an instance yourself and please 🙏 help us out with documentation.
* Take ownership of some of the [issues we already documented](https://github.com/discursus-io/discursus_core/issues), and send over some PRs
* Create issues every time you feel something is missing or goes wrong.

All sort of contributions are **welcome and extremely helpful** 🙌 

&nbsp;

# License

discursus core is [MIT licensed](./LICENSE.md).
