#!/bin/sh -u

for MATLAB_HOME in /Applications/MATLAB_R*; do
    printf "Try %s\n" "${MATLAB_HOME}"
    mvn clean package > /dev/null 2>&1
    if JAVA_HOME=$(/usr/libexec/java_home -v 11) java -Djava.library.path="$MATLAB_HOME/bin/maci64"  -jar ./target/matlab-java11-1.0-SNAPSHOT-jar-with-dependencies.jar > /dev/null 2>&1; then
        printf "Java 11 works well with %s\n" "${MATLAB_HOME}"
    else
        printf "Java 11 does not work well with %s\n" "${MATLAB_HOME}"
    fi
done
