# Jira Xbar Script

Script to fetch data from JIRA.

## Table of contents

* [Usage](#configuration)
  - [Install xbar](#install-xbar)
  - [Adapt script to your queue](#adapt-script-to-your-queue)
  - [Clone this repository](#clone-this-repository)
  - [Link script in plugins folder](#clone-this-repository)

## Configuration
### Install xbar
 Follow the instructions in their official web-site: [https://xbarapp.com/](xbarapp)

### Clone this repository
Run the git clone command on a PATH of your preference:

    command-here

### Adapt script to your queue
The script is prepared to take tickets from ATT PS queue, you need to change that to your team
servicedesk_id and queue_id
Change that in: The jira_queue_xbar/jira-script.rb

### Link script in plugins folder
Using the path to the cloned repository, use the link command:

    ln -s PATH/jira_queue_xbar/jira-script.rb PATH/plugins/jira-attendance-support-tickets.1m.rbb