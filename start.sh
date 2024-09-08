# !/bin/bash
sudo yum install -y java-21-amazon-corretto-devel
BUILD_JAR=$(ls /home/ec2-user/build/*.jar)
JAR_NAME=$(basename $BUILD_JAR)
echo "> build 파일명: $JAR_NAME" >> /home/ec2-user/deploy.log

echo "> build 파일 복사" >> /home/ec2-user/deploy.log
DEPLOY_PATH=/home/ec2-user/
cp $BUILD_JAR $DEPLOY_PATH

echo "> 현재 실행중인 애플리케이션 pid 확인" >> /home/ec2-user/deploy.log
CURRENT_PID=$(pgrep -f $JAR_NAME)

if [ -z $CURRENT_PID ]
then
  echo "> 현재 구동중인 애플리케이션이 없으므로 종료하지 않습니다." >> /home/ec2-user/deploy.log
else
  echo "> kill -15 $CURRENT_PID"
  kill -15 $CURRENT_PID
  sleep 5
fi

DEPLOY_JAR=$DEPLOY_PATH$JAR_NAME
echo "> DEPLOY_JAR 배포"    >> /home/ec2-user/deploy.log
nohup java -jar $DEPLOY_JAR >> /home/ec2-user/deploy.log 2>/home/ec2-user/deploy_err.log &
# JARFILE=$(ls /home/ubuntu/build/target/*.jar)
# echo "filename : $JARFILE" >> startsh.log

# CURRENT_PID=$(pgrep -f $JARFILE)
# echo "currentpid : $CURRENT_PID" >> startsh.log
# kill -9 $CURRENT_PID 2>/dev/null
# sleep 5

# nohup java -jar $JARFILE > /dev/null 2> /dev/null < /dev/null &
