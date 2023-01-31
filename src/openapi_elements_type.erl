-module(openapi_elements_type).

-export([encode/1]).

-export_type([openapi_elements_type/0]).

-type openapi_elements_type() ::
    #{ 
     }.

encode(#{ 
        }) ->
    #{ 
     }.
