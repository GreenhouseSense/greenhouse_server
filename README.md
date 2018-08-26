# Greenhouse server

## Overview
Web server (API) that stores and yield information (readings and actions) of a internet-connected greenhouse.

The greenhouse is equiped with sensors and actuators that allows to control the environment and promote seed growth. While sensors provides readings, atuators performs actions, and both readings and decisions are communicated and stored in this database.

An android mobile app allows to vizualise readings and actions as well as post actions to be performed in the greenhouse.

## Platforms
- Ruby on Rails
- MySQL
- Arduino

## Changelog

## API endpoints
Prefix Verb URI Pattern                            Controller#Action

POST /api/v1/readings/add(.:format)         api/v1/readings#add
GET  /api/v1/readings/get_last(.:format)    api/v1/readings#get_last
GET  /api/v1/readings/get_weeks(.:format)   api/v1/readings#get_weeks
GET  /api/v1/readings/get_months(.:format)  api/v1/readings#get_months
GET  /api/v1/readings/get_years(.:format)   api/v1/readings#get_years

GET  /api/v1/decisions/get_last(.:format)   api/v1/decisions#get_last
GET  /api/v1/decisions/get_weeks(.:format)  api/v1/decisions#get_weeks
GET  /api/v1/decisions/get_years(.:format)  api/v1/decisions#get_years
GET  /api/v1/decisions/get_months(.:format) api/v1/decisions#get_months
POST /api/v1/decisions/add(.:format)        api/v1/decisions#add


## Usage
*Create user:* ```rails c``` >> only
*Create greenhouse:* ```rails c``` >> only
