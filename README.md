# Debugging with Docker Containers

### Files in this Repo

* __Dockerfile__ A Sample Dockerfile which will let you run C source code as a Dockerized application
* __README.md__ This readme file
* __buffer_overflow.c__ A very simple program to demonstrate that the file can be ran and then also debugged inside of the docker container
* __dockerfile.uew__ An Ultra Edit Wordfile which will provide syntax highlighting for your Ultra Edit Editor
* __vimrc__ A useful vim file if you want it

### Configure the Dockerfile
1. Change ```EXPOSE 9999``` on line 14 to your choice of port of leave it as the default. If you change it then also adjust ```TCP-LISTEN:9999``` to match on line 38.
2. Change all instances of easy_overflow.c to whatever the name of your C source code file is.
3. If you need 32-bit support uncomment lines 21 and 22.

### Build the Docker Container
```docker build --squash -t developer .```

### Run the Docker Container and Your Program
ASLR ON (and no gdb support): ```docker run -d -p 9999:9999 developer ```  
ASLR OFF (and gdb support): ```docker run -d -p 9999:9999 --privileged developer ``` 

### Connect to the Docker Application
```nc localhost 9999``` or your favorite terminal application.  
Note* You may need to replace localhost with the port for your docker instance.

#### Here are the steps to find your docker container's IP address:
 * ```docker ps``` which should results in something that looks like:
```
CONTAINER ID        IMAGE               COMMAND                  CREATED             ...SNIP...
7ad8660a424f        developer           "socat TCP-LISTEN:..."   23 seconds ago      ...SNIP...
```
 * ```docker inspect <CONTAINER ID> | grep IPAddress```
