# Investigating a Drop in User Engagement

This case study investigates a drop in user engagement at a social networking site using randomly generated synthetic data supplied by [Mode Analytics](https://mode.com/).

## Description

This repo contains my response to the Mode Analytics SQL Analytics Training [case study of the same name](https://mode.com/sql-tutorial/a-drop-in-user-engagement). Mode contends that the project can be completed in SQL or Python, so my response employs both tools.

### Table of Contents

Here's a quick summary of what you'll find in this repo.
* [data](https://github.com/jkurdys/yammer/tree/main/data) the complete data set consisting of the following tables exported from Mode:
    * Users
    * Events
    * Email Events
    * Rollup Periods
* [images](https://github.com/jkurdys/yammer/tree/main/images) generated charts and graphs for data analysis
* [notebooks](link) Jupyter notebooks that walk users through the data analysis process
* [src](link) all code for the project in SQL and Python 3 formatted scripts

### The problem

Here is Mode's prompt:

>You show up to work Tuesday morning, September 2, 2014. The head of the Product team walks over to your desk and asks you what you think about the latest activity on the user engagement dashboards. You fire them up, and [something immediately jumps out](https://app.mode.com/modeanalytics/reports/cbb8c291ee96/runs/7925c979521e/viz1/cfcdb6b78885):

![chart](https://app.mode.com/modeanalytics/reports/cbb8c291ee96/runs/7925c979521e/viz1/cfcdb6b78885)

>The above chart shows the number of engaged users each week. Yammer defines engagement as having made some type of server call by interacting with the product (shown in the data as events of type "engagement". Any point in this chart can be interpreted as "the number of users who logged at least one engagement event during the week starting on that date."

### The data

- **Table 1: Users**
    - This table includes one row per user, with descriptive information about that user's account.
    - This table name in Mode is tutorial.yammer_users
        - **user_id:** 	    A unique ID per user. Can be joined to user_id in either of the other tables.
        - **created_at:** 	The time the user was created (first signed up)
        - **state:** 	    The state of the user (active or pending)
        - **activated_at:** The time the user was activated, if they are active
        - **company_id:** 	The ID of the user's company
        - **language:** 	The chosen language of the user
- **Table 2: Events**
    - This table includes one row per event, where an event is an action that a user has taken on Yammer. These events include login events, messaging events, search events, events logged as users progress through a signup funnel, events around received emails.
    - This table name in Mode is tutorial.yammer_events
        - **user_id:** 	    The ID of the user logging the event. Can be joined to user\_id in either of the other tables.
        - **occurred_at:** 	The time the event occurred.
        - **event_type:** 	The general event type. There are two values in this dataset: "signup_flow", which refers to anything occuring during the process of a user's authentication, and "engagement", which refers to general product usage after the user has signed up for the first time.
        - **event_name:** 	The specific action the user took. Possible values include:
            - create_user: User is added to Yammer's database during signup process
            - enter_email: User begins the signup process by entering her email address
            - enter_info: User enters her name and personal information during signup process
            - complete_signup: User completes the entire signup/authentication process
            - home_page: User loads the home page
            - like_message: User likes another user's message login: User logs into Yammer
            - search_autocomplete: User selects a search result from the autocomplete list
            - search_run: User runs a search query and is taken to the search results page
            - search_click_result_X: User clicks search result X on the results page, where X is a number from 1 through 10.
            - send_message: User posts a message view_inbox: User views messages in her inbox
        - **location:**	    The country from which the event was logged (collected through IP address).
        - **device:**	    The type of device used to log the event.
- **Table 3: Email Events**
    - This table contains events specific to the sending of emails. It is similar in structure to the events table above.
    - This table name in Mode is tutorial.yammer_emails
        - **user_id:** 	The ID of the user to whom the event relates. Can be joined to user_id in either of the other tables.
        - **occurred_at:** 	The time the event occurred.
        - **action:** 	The name of the event that occurred.
            - "sent_weekly_digest" means that the user was delivered a digest email showing relevant conversations from the previous day.
            - "email_open" means that the user opened the email.
            - "email_clickthrough" means that the user clicked a link in the email.
- **Table 4: Rollup Periods**
    - The final table is a lookup table that is used to create rolling time periods. Though you could use the INTERVAL() function, creating rolling time periods is often easiest with a table like this. You won't necessarily need to use this table in queries that you write, but the column descriptions are provided here so that you can understand the query that creates the chart shown above.
    - This table name in Mode is benn.dimension_rollup_periods
        - **period_id:** 	This identifies the type of rollup period. The above dashboard uses period 1007, which is rolling 7-day periods.
        - **time_id:** 	This is the identifier for any given data point — it's what you would put on a chart axis. If time_id is 2014-08-01, that means that is represents the rolling 7-day period leading up to 2014-08-01.
        - **pst_start:** 	The start time of the period in PST. For 2014-08-01, you'll notice that this is 2014-07-25 — one week prior. Use this to join events to the table.
        - **pst_end:** 	The start time of the period in PST. For 2014-08-01, the end time is 2014-08-01. You can see how this is used in conjunction with pst_start to join events to this table in the query that produces the above chart.
        - **utc_start:** 	The same as pst_start, but in UTC time.
        - **pst_start:** 	The same as pst_end, but in UTC time.

<!--- 
## Getting Started

### Dependencies

* Describe any prerequisites, libraries, OS version, etc., needed before installing program.
* ex. Windows 10

### Installing

* How/where to download your program
* Any modifications needed to be made to files/folders

### Executing program

* How to run the program
* Step-by-step bullets
```
code blocks for commands
```

## Help

Any advise for common problems or issues.
```
command to run if program contains helper info
```
-->
## Authors

[Joshua Kurdys](https://www.linkedin.com/in/joshua-kurdys/)

<!---
## Version History

* 0.2
    * Various bug fixes and optimizations
    * See [commit change]() or See [release history]()
* 0.1
    * Initial Release

## License

This project is licensed under the [NAME HERE] License - see the LICENSE.md file for details

## Acknowledgments

Inspiration, code snippets, etc.
* [awesome-readme](https://github.com/matiassingers/awesome-readme)
* [PurpleBooth](https://gist.github.com/PurpleBooth/109311bb0361f32d87a2)
* [dbader](https://github.com/dbader/readme-template)
* [zenorocha](https://gist.github.com/zenorocha/4526327)
* [fvcproductions](https://gist.github.com/fvcproductions/1bfc2d4aecb01a834b46)

-->
