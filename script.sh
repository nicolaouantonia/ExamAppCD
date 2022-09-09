artifactory_url="http://localhost:8081/artifactory"

repo="libs-snapshot-local"
artifacts="com/amdocs/webapp/ExamApp/"           

url=$artifactory_url/$repo/$artifacts

file=`curl -s $url/maven-metadata.xml`

version=`curl -s $url/maven-metadata.xml | grep latest | sed "s/.*<latest>\([^<]*\)<\/latest>.*/\1/"`

build=`curl -s $url/$version/maven-metadata.xml | grep '<value>' |head -1 | sed "s/.*<value>\([^<]*\)<\/value>.*/\1/"`

BUILD_LATEST="$url/$version/ExamApp-$build.war"
echo "File Name  = " +$BUILD_LATEST

echo $BUILD_LATEST > filename.txt
