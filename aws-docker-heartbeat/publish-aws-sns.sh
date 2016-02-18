#/bin/bash
#http://docs.aws.amazon.com/cli/latest/userguide/cli-sqs-queue-sns-topic.html#cli-publish-sns-topic
snsArn=$1
instanceRegion=$2
instanceId=$3
aws sns publish --topic-arn $snsArn --message '{"error":"Docker not running in the instance, a reboot will be triggered","region": "instanceRegion","instanceId": "$instanceId"}'