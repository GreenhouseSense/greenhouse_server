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

POST /api/v1/actions/add(.:format)          api/v1/actions#add
GET  /api/v1/actions/get_all(.:format)      api/v1/actions#get_all
GET  /api/v1/actions/get(.:format)          api/v1/actions#get
GET  /api/v1/actions/update(.:format)       api/v1/actions#update
GET  /api/v1/actions/destroy(.:format)      api/v1/actions#destroy
POST /api/v1/readings/add(.:format)         api/v1/readings#add
GET  /api/v1/readings/get_last(.:format)    api/v1/readings#get_last
GET  /api/v1/readings/get_weeks(.:format)   api/v1/readings#get_weeks
GET  /api/v1/readings/get_months(.:format)  api/v1/readings#get_months GET  /api/v1/readings/get_years(.:format)   api/v1/readings#get_years
   api/v1/decisions#get_last
api_v1_decisions_get_weeks GET  /api/v1/decisions/get_weeks(.:format)  api/v1/decisions#get_weeks
api_v1_decisions_get_years GET  /api/v1/decisions/get_years(.:format)  api/v1/decisions#get_years
api_v1_decisions_get_months GET  /api/v1/decisions/get_months(.:format) api/v1/decisions#get_months
api_v1_decisions_add POST /api/v1/decisions/add(.:format)        api/v1/decisions#add
api_v1_sessions_login POST /api/v1/sessions/login(.:format)       api/v1/sessions#login
api_v1_sessions_logout POST /api/v1/sessions/logout(.:format)      api/v1/sessions#logout
api_v1_sessions_new_user POST /api/v1/sessions/new_user(.:format)    api/v1/sessions#new_user


## Usage
*Create user:* 
```
rails c
new_user = User.create(email:"teste@teste.com", password:"testeteste",password_confirmation:"testeteste")
new_greenouse_service  = GreenhouseService.create(email:"service@teste.com", password:"testeteste",password_confirmation:"testeteste")
new_greenhouse = Greenhouse.create(location:"nowhere", description:"estufa de teste", user_id:u.id)
```
*Create greenhouse:* ```rails c``` >> only
