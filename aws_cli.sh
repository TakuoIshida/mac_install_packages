#!bin/bash
curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
sudo installer -pkg AWSCLIV2.pkg -target /
which aws
aws --version

# https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html