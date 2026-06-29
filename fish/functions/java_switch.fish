function java_switch
    set -gx JAVA_HOME (/usr/libexec/java_home -v $argv)
    echo "JAVA_HOME is now $JAVA_HOME"
end
