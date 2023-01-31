-module(openapi_resource_id).

-export([encode/1]).

-export_type([openapi_resource_id/0]).

-type openapi_resource_id() ::
    #{ 
     }.

encode(#{ 
        }) ->
    #{ 
     }.
