-module(openapi_condition_set_type).

-export([encode/1]).

-export_type([openapi_condition_set_type/0]).

-type openapi_condition_set_type() ::
    #{ 
     }.

encode(#{ 
        }) ->
    #{ 
     }.
