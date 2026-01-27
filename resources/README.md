Steps for Implementation:
1. Deploy a VPC and a Subnet
2. Deploy an Internet Gateway and associate it with the VPC
3. Setup a route table with a route to the IGW
4. Deploy an EC2 instance inside of the created subnet & associate a public IP
5. Associate a SG that allows public ingress
6. Change the EC2 instance to use a publicly available Nginx AMI