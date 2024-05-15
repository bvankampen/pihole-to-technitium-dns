#!/bin/bash

source settings.env

curl http://$API_HOST/api/user/session/get?token=$TOKEN
