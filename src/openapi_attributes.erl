-module(openapi_attributes).

-export([encode/1]).

-export_type([openapi_attributes/0]).

-type openapi_attributes() ::
    #{ 
     }.

encode(#{ 
        }) ->
    #{ 
     }.
