#!/bin/sh -u

if java -version 2>&1 | head -n 1 | grep -F 'openjdk version "11.0' > /dev/null ; then
    printf "We use the following Java version:\n"
    java -version
else
    printf "Error: Java 11 is not executed by default.\n"
    java -version
    exit 1
fi
for MATLAB_HOME in /usr/local/R*; do
    printf "Try %s\n" "${MATLAB_HOME}"
    [ ! -f "$MATLAB_HOME/bin/matlab" ] && continue
    mvn clean package > /dev/null 2>&1
    if java -Djava.library.path="${MATLAB_HOME}/bin/glnxa64"  -jar ./target/matlab-java11-1.0-SNAPSHOT-jar-with-dependencies.jar > /dev/null 2>&1; then
        printf "Java 11 works well with %s\n" "${MATLAB_HOME}"
    else
        printf "Java 11 does not work well with %s\n" "${MATLAB_HOME}"
    fi
done
