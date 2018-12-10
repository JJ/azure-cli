#!/usr/bin/python

import os
import sys
import json
from azure.mgmt.resource import ResourceManagementClient
from azure.common.credentials import ServicePrincipalCredentials

subscription_id = sys.argv[1]
tenant_id = sys.argv[2]
credentials_file = sys.argv[3]

with open(credentials_file, 'r') as content_file:
    content = content_file.read()

credentials = json.loads(content)

creds = ServicePrincipalCredentials(client_id=credentials['client_id'], secret=credentials['secret'], tenant=tenant_id)
resource_client = ResourceManagementClient(creds, subscription_id)


subscription_client = SubscriptionClient(creds)
locations = subscription_client.subscriptions.list_locations(subscription_id)
for location in locations:
    print(location.name)


