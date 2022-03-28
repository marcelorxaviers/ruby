In order to make it work you gotta set both global ENV vars in as follows:
launchctl setenv "JIRA_USER_EMAIL" "marcelo.ribeiro@jobandtalent.com"
launchctl setenv "JIRA_API_TOKEN" JIRA_API_TOKEN_HERE

You can create your JIRA_API_TOKEN at https://id.atlassian.com/manage-profile/security/api-tokens

Checkout https://developer.atlassian.com/cloud/jira/service-desk/rest/api-group-servicedesk/
Especially #api-rest-servicedeskapi-servicedesk-servicedeskid-queue-queueid-get



