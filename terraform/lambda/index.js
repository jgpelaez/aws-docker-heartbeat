var aws = require('aws-sdk')

exports.handler = function(event, context) {
    var ec2 = new aws.EC2({region: event.region, maxRetries: 15});
    console.log(event)
    console.log(context)

    var params = {
      InstanceIds: [ 
        event.instanceId,
      ]
    };
    ec2.rebootInstances(params, function(err, data) {
      if (err) {
          console.log(err, err.stack); 
          context.fail(error);
      }
      else {
          console.log("Instance rebooted");
          console.log(data);           // successful response
          // reboot is asynchronous the ok return is if it's possible to do,
          // for example, the instances is RUNNING, have all permissions,etc.
          context.succeed();
      }
    });

};