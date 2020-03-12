## Flask basic Service

### Prerequisite
* Pycharm or similar IDE
* Virtualenv setup
* Python3.7

##Getting Started
### To setup virtualenv
1) Create separate folder outside repo folder e.g "env" folder.
2) Inside that env folder run following
    > pip3 install virtualenv
           
    > virtualenv -p python3 {name-of-virtual-env}
3) To activate this virtualenv hit one of the command.
    > source {name-of-virtual-env}/bin/activate 

    > . {name-of-virtual-env}/bin/activate
                                                                                                            
    Now from your project root dir, run following                                                                                                            

    > pip3 install -r requirements.txt
                                                                                                            
To stop this virtualenv, just type
    
> deactivate      

### create .env file on root and copy-paste env.default data into it.                  
    
### To run with docker 
to run this using docker use docker_commands file in docker_config folder
                                      
### To run this project
Before run this project, you need to install all required packages.

   > ./run_app.sh {env_name} {path of virtual env root folder}

   > /health-check   (hit following api to check)

   > "/ "   (at root level you will get Swagger doc for this)

### To run unit tests

To run unit test on local env, Start redis server and dynamoDB. Start virtualenv and set following path

   > ./run_test.sh {path of virtual env root folder}

   > ./run_test_coverage.sh {path of virtual env root folder}

