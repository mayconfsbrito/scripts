#!/bin/bash

while [ true ]; do 

	cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 226 | head -n 1

done