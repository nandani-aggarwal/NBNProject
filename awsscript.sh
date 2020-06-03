#Spinup EC2 instance
#aws cloudformation deploy --template /path_to_template/my-template.json --stack-name my-new-stack --parameter-overrides Key1=Value1 Key2=Value2
#aws cloudformation deploy --template-file EC2_Instance.json --stack-name "nbn-ec2-stack" --region ap-southeast-2 --parameter-overrides InstanceType="t2.micro" SSHLocation="0.0.0.0/0" HTTPLocation="0.0.0.0/0" ICMPLocation="0.0.0.0/0" KeyName="Nandani_infosys"

aws ec2 start-instances --instance-ids i-01d86d9152120c5fa

aws ec2 describe-instances --instance-ids i-01d86d9152120c5fa

#Login remotely to it
#ssh -i <path to key> <Insatnce username>@<Instance Public DNS>
$ ssh -i Nandani_infosys.pem ec2-user@<Public DNS>

$ sudo su
$ sudo yum install -y

#Install jdk
sudo yum install java-1.8.0-openjdk-devel -y
export JAVA_HOME="/usr/lib/jvm/java-1.8.0-openjdk"
export PATH=$PATH:$JAVA_HOME/bin



#Download your microservice repo
$ ssh-keygen -t rsa -b 4096 -C "nandinitechno@email.com"

7. #sudo vi /root/.ssh/id_rsa.pub (This will allow you to view the key so you can copy and paste it)
8. Go to http://github.com/settings/keys
9. Click New SSH Key
10. Add title
11. Paste your Key
12. Click "Add SSH Key"
13.Enter your password for GitHub
create a directory on your local linux instance (e.g. mkdir github)
cd github/
#git clone git@github.com:my-git-repository
git clone nandani-aggarwal@https://github.com/nandani-aggarwal/NBNProject.git

#Build it
./gradlew clean build


#Install the Docker
sudo yum install -y docker
# Start the Docker service.
sudo service docker start
# Add the ec2-user to the docker group so you can execute Docker commands without using sudo.
sudo usermod -a -G docker ec2-user
#login to docker
docker login

#Build docker image
$ sudo docker build --tag nandani/nbnhelloImageTag:1.0 .

#Run docker image
$ sudo docker run --publish 8080:8080 --detach --name nbnhelloconatiner nandani/nbnhelloImageTag:1.0






