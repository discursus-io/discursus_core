<!---
Provide a short summary in the Title above. Examples of good PR titles:
* "Feature: add so-and-so models"
* "Fix: deduplicate such-and-such"
* "Update: dbt version 0.13.0"
-->

## Description & motivation
<!---
Add a description of what that storie's goal is, or add a link to its associated Github ticket.
-->

## Changes to ERD
<!---
Based on the description above, what are the changes you're making in the data platform. Add a screenshot of the ERD you're changing and add description of main changes happening (e.g. new fact table added; adding new fields, etc.)
Here are the commands to generate graph:
- dbdocs build wh_docs/warehouse.dbml
- Follow link
- Go to dag
- Screenshot
-->

## Changes to DAG
<!---
Show us the relevant dbt models that are being introduced or changed by inserting a screen shot of the DAG section that is impacted. 
Here are the commands to generate graph:
- dbt docs generate
- dbt docs serve
- Go to Relationship tab
- Screenshot
-->

## Checklist:
<!---
This is for you as a developer. Have you done all the following tasks before submitting this PR?
-->
- [ ] My pull request represents one story (logical piece of work).
- [ ] I ran the Docker data platform in my development environment without error.
- [ ] I ran the data pipelines in my development environment without error.
- [ ] I ran the sqlfluff linter in my development environment without error.