#AWS
#Create user in AWS console with AmazonEC2FullAccess Permissions and get access key and secret key

#AWS CONfigure to login
# aws configure
#AWS Access Key ID [None]: AKIAIOSFODNN7EXAMPLE
#AWS Secret Access Key [None]: wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
#Default region name [None]: us-west-2
#Default output format [None]: json

#Spinup EC2 instance
#aws cloudformation deploy --template /path_to_template/my-template.json --stack-name my-new-stack --parameter-overrides Key1=Value1 Key2=Value2
aws cloudformation deploy --template ./EC2_Instance.json --stack-name nbn-ec2-stack

#Login remotely to it
#ssh -i <path to key> <Insatnce username>@<Instance Public DNS>
$ ssh -i ~/.ssh/nbnEc2.pem ec2-user@<EC2-PUBLIC-DNS>
$ sudo su
$ sudo yum install -y

#Install jdk
$ sudo yum update -y
$ sudo yum install java-1.8.0-openjdk.x86_64
$ export JAVA_HOME="/usr/lib/jvm/jdk-1.8.0-openjdk.x86_64"
$ export PATH=$PATH:$JAVA_HOME/bin
#Install gradle
$ wget https://services.gradle.org/distributions/gradle-6.4.1-bin.zip -P /tmp
$ sudo unzip -d /opt/gradle /tmp/gradle-6.4.1-bin.zip
$ export GRADLE_HOME=/opt/gradle/gradle-6.4.1
$ export PATH=${GRADLE_HOME}/bin:${PATH}
$ sudo chmod +x /etc/profile.d/gradle.sh
$ source /etc/profile.d/gradle.sh


#Download your microservice repo
$ ssh-keygen -t rsa -b 4096 -C "nandinitechno@email.com"

7. #sudo vi /root/.ssh/id_rsa (This will allow you to view the key so you can copy and paste it)
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
#sudo yum install -y docker
sudo amazon-linux-extras install docker
# Start the Docker service.
sudo service docker start
# Add the ec2-user to the docker group so you can execute Docker commands without using sudo.
sudo usermod -a -G docker ec2-user

#Build docker image
$ sudo docker build --tag nandani/nbnhelloImageTag:1.0 .

#Run docker image
$ sudo docker run --publish 8080:8080 --detach --name nbnhelloconatiner nandani/nbnhelloImageTag:1.0






