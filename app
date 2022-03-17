Commands
------------
1. Build Docker Image
docker build -t test .

2. Run container /w image
docker run -d --publish 8888:5000 test

3. Login to ECR
aws ecr get-login-password --region REGIONHERE!!!! | docker login --username AWS --password-stdin ACCOUNTIDHERE!!!!.dkr.ecr.REGIONHERE!!!.amazonaws.com

4. Tag the version
docker tag test:latest YOURACCOUNT.dkr.ecr.YOURREGION-1.amazonaws.com/YOURREPO:YOURTAG

5. Upload
docker push YOURACCOUNT.dkr.ecr.YOURREGION.amazonaws.com/YOURREPO:YOURTAG

Policy Document
-----------
ECR
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": "ecr:*",
            "Resource": "*"
        },
        {
            "Sid": "VisualEditor01",
            "Effect": "Allow",
            "Action": "ecr:GetAuthorizationToken",
            "Resource": "*"
        },
        {
            "Sid": "VisualEditor02",
            "Effect": "Allow",
            "Action": "ecr:InitiateLayerUpload",
            "Resource": "*"
        }
    ]
}

ECS
arn:aws:iam::aws:policy/AmazonECS_FullAcces
