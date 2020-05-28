#/bin/bash

if [[ $# -eq 0 ]] ; then
    echo 'No parameters found - build, unittest, integrationtest, run'
    exit 1
fi

for var in "$@"
do
  echo $var
  case $var in
	build)
		echo "Building jar!"
		gradlew clean build
		break
		;;
	unittest)
		echo "Running unit tests!"
		gradlew test
		break
		;;
  integrationtest)
		echo "Running integration tests!"
		gradlew integrationTest
		break
		;;
  run)
		echo "Running application!"
		gradlew bootRun
		break
		;;
	*)
		echo "Parameters donot match"
		;;
  esac
done
gradlew clean

