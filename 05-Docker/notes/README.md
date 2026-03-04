\* what is docker



\- Docker is a tool which creates containers in which the applications runs , it creates the environment which can run in any machine which has docker installed

\- develop faster and run anywhere

\- creates virtual environment like vm (container)

\- images are used



which required lib etc and we ship this container using client



\* why was it created



\- application working on my machine and not in your machine to solve this problem





\* virtualization vs containerization



Virtualization - vm are used       it uses  hypervisor which **allocate** the resources like cpu storage etc to run a operating system on another operating system. virtulization is heavy .



containerization - uses docker engine , it shares hosts operating system , light weight       container





-- Docker architecture --



1. docker Engine (Docker application container engine) -  in which containers runs
2. Docker Daemon (docker D) - service manages containers/application -===> it has container D=>  cncf tool for creating container and  for managing
3. Docker CLI(command line interface) -> docker commands
4. Docker Client - to view all the docker stuff -> it connects   api -> it connect/talk to docker engine  and shows container. (docker desktop)



-- Docker installation --





on Local - create a docker account, get docker to download docker desktop install

on aws -  go to ec2 instance create small machine  - > install **sudo apt-get install** docker.io

  To-check docker service - **sudo systemctl status docker**



**docker ps** -  view containers ,  but if you get error -  permission denied while trying to connect to docker deamon , in this case our user dont have permission so we need to add our user to docker group  **sudo usermod -aG docker $User => newgrp docker and it works.**





**Docker-File (Instruction to build image )->  docker Image(application , env etc) -> Docker Container**



**Docker-File ->** In docker file instruction are written and on the basis of those docker image is made



**Docker Images**



what is Docker image - it is written using docker file - it is a blueprint in which the steps are  written what is needed to run the application, environment  and then we can make container of the image . we can create multiple containers from the image





we can pull prebuilt images from docker hub





**Docker Hub** - it stores images online ()

 





**Docker Login** - to log in docker hub   -> enter username , password \*\*\*\*

&nbsp;              login using personal acess token - login to docker hub - go to personal acess token , generate a new token , give read write delete...        

&nbsp;repeat docker login -> enter username -> enter your personal acess token.





**docker pull** -> it pulls the image from docker hub  like -> docker pull hello-world( hellow world is a image)



**docker images** - to view images in machine 



**docker run** - it is user to run or we can say create the container (**docker run hello-world**)



always run docker container in detached mode  - **docker run -d  hello-world**



**docker stop**





**docker build -t java-app . --> t**his command is used to build and name docker file **. means use docker file as a context**



 **docker run java-app -=> to run the java app (it will stop after running only one time)**





**whenever we do changes to the code we need to buld the image again docker build -t java-app .**





**docker run -d -p 80:80 imagename**

**docker logs containeri**



**docker attach id to view logs on real time** 



docker stop id





docker exec -it container- id bash ( we can go inside ) 



docker run -itd ubntu -> to ran container running always











##### **Docker Network**



**. Host** 

**. bridge(default)**

**. User Defined Bridge(custom)**

**. None(Isolated)**

. MACVLAN (mac address -- used is docker swarm)

. IPVLAN

. Overlay 





**docker network ls** ->to view listed network



**docker network create mynetwork -d bridge** -> used to create user defined network  d is     driver



**docker inspect network** to inspect network



docker restart containerid - data does not delete   



two tier application setup - 





MySQL -> docker run -d --name mysql --network connect -e MYSQL\_ROOT\_PASSWORD=root -e MYSQL\_DATABASE=devops mysql



-for app ---> docker run -d -p 5000:5000 --network connect -e MYSQL\_HOST=mysql -e MYSQL\_USER=root -e MYSQL\_PASSWORD=root -e MYSQL\_DB=devops two-tier:latest







DOCKER VOLUME AND STROAGE



docker volume ls - to view volumes

docker volume create mysql-data - to create volume 

docker inspect volumename - to check mountpoint location of the volume 

docker volume inspect volumename 

&nbsp;



docker run -d --name mysql --network connect -v mysql-data:/var/lib/mysql -e MYSQL\_ROOT\_PASSWORD=root -e MYSQL\_DATABASE=devops MySQL





&nbsp;docker run -d --mysql --network connect -v mysql-data:/var/lib/mysql -e MYSQL\_ROOT\_PASSWORD=root -e MYSQL\_DATABASE=devops MySQL





DOCKER COMPOSE -- 



docker system prune  remove all the stooped things



docker rmi imageid is to remove image

docker images -iq  we will get all the id of the images



docker rmi  -f (docker images -iq)

docker compose up



docker compose up -d --build  

docker compose down



docker attach container-id 



DOCKER REGISTRY



&nbsp;docker image tag two-tier-flask-app-flask:latest ashishkohli/two-tier:latest

docker push ashishkohli/two-tier:latest





multistage docker build -> break down docker file into small stages 



nohup docker attach containerid \&



Orchestrating Docker with Kubernetes













&nbsp;









 



 

