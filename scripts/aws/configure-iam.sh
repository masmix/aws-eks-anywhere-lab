# AWS configure 

aws configure sso

or 

aws configure 

# Create IAM role

aws iam create-role \
     --role-name AmazonEKSConnectorAgentRole \
     --assume-role-policy-document file://eks-connector-agent-trust-policy.json --profile coe

        "Arn": "arn:aws:iam::022698001278:role/AmazonEKSConnectorAgentRole",

# Put role policy 
aws iam put-role-policy \
     --role-name AmazonEKSConnectorAgentRole \
     --policy-name AmazonEKSConnectorAgentPolicy \
     --policy-document file://eks-connector-agent-policy.json --profile coe
