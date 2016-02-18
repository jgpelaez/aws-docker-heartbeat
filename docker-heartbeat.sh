#/bin/bash
#set -xv

handle_docker_not_running() {
    echo "docker is not running"
# TODO trigger an action on aws
    exit;
}

handle_docker_not_healthy() {
    echo "docker is not healthy"
# TODO trigger an action on aws 
    exit;
}

test_docker_is_healthy() {
    local dockertimeout
#    dockertimeout=$(eval "timeout 1s sleep 5s")
    dockertimeout=$(eval "timeout 30s docker info")
    if [ $? -ne 0 ]; then
        handle_docker_not_healthy;
        exit;
    fi
}

test_docker_is_running() {
    dockerinfo=$(docker info)
#    echo $dockerinfo
    if [ -z "$dockerinfo" ]; then
# if docker info is empty, docker is not running
    	handle_docker_not_running
    fi
}
    
test_docker_is_healthy
test_docker_is_running
