Blue Button Sample Client Application - Rails Version
======================================================

## Introduction

This client demonstrates authenticating to the Blue Button API and subsequent FHIR API calls.
It demonstrates the OAuth2 Server Side web application flow where a `client_secret` is used.

This client is built using the Ruby on Rails web application framework. 

The 'oauth2' Ruby Gem is used for OAuth 2.0 client functions.

Docker is used to containerize (or virtualize) the Rails web application server.

## Status and Contributing

This demo app is still a work in progress! 

The goal of this demo is to provide examples of the technical interaction with the Bluebutton API. So it doesn't
include other aspects, such as styling or a user management framework. 

The application is in active development so check back often for updates.
Please consider improving this code with your contributions. Pull requests welcome ;) 

## Prerequisite DOCKER Software Requirement

This demo utilizes DOCKER (docker-compose) with the goal of being compatible with different platforms and operating systems. 

Please follow the information at the following link for installation instructions: https://docs.docker.com/compose/install/

NOTE: If using a Linux, your distro may have packages available to install instead. For example, for Fedora you can run the following command to install:

    dnf install docker-compose

On RedHat this would be:

    yum install docker-compose


## Clone the Repository

    git clone https://github.com/CMSgov/bluebutton-sample-client-rails.git
    cd bluebutton-sample-client-rails 

## Setting up a Sandbox Application

To run this demo application, you will need to signup for a developer account
at our https://sandbox.bluebutton.cms.gov/ site.

Please reference our documentation for more information at: https://bluebutton.cms.gov/developers/ .

Once you have your developer account created and you've verified your email address,
you'll need to set up an application. Log in to your new account, and select
"Applications" -> "Applications You Created" -> "Register New Application". From
here, you can fill out the form with the following options:

    Scope: [you likely want to select all available]
    Name: [your choice]
    Client type: Confidential
    Authorization grant type: Authorization Code
    Redirect uris: http://localhost:3000/bluebutton_callback/

Once you submit the form, you should receive an application key and secret that
can be be added to the local_env.yml file in the next step.

## Configuring the Client Side ENV settings in the local_env.yml file.

Run the following commands to copy the sample configuration file:

    cd bluebutton-sample-client-rails
    cp config/local_env_sample.yml config/local_env.yml

Edit the local_env.yml file and update the following entries in the development section with your
application's client id and secret: 

    BB_CLIENT_ID: "<enter client id here>"
    BB_CLIENT_SECRET: "<enter client secret here>"


## Startup the Rails application server with in a Docker container.

Enter the following command to build the docker image. This only needs to be run once or when
making certain types of changes to the application code.

    docker-compose build

Any time you want to start the Rails server container use the following command:

    docker-compose up


Any time you want to gracefully stop the Rails server container use the following command:

    docker-compose down
    
### Final Step

To use and test the demo application you can navigate to http://localhost:3000 in your web browser.


## This README and demo app is still a work in progress :-)

This README and demo app is still in progress! More to come :-)
