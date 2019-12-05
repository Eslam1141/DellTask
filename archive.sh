#!/bin/bash

zip Helloworld-${BUILD_NUMBER}.zip -r HelloWorldSolution/bin/Debug/netcoreapp2.2/publish/** HelloWorldTest/TestResults/** 
