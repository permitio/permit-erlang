-module(openapi_policy_repo_status).

-export([encode/1]).

-export_type([openapi_policy_repo_status/0]).

-type openapi_policy_repo_status() ::
    #{ 
     }.

encode(#{ 
        }) ->
    #{ 
     }.
