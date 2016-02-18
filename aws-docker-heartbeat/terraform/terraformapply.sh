#/bin/bash
cd lambda
zip  DockerNotAliveInInstance.lambda.zip *.js
cd ..

terraform apply