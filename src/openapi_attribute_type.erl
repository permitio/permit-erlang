-module(openapi_attribute_type).

-export([encode/1]).

-export_type([openapi_attribute_type/0]).

-type openapi_attribute_type() ::
    #{ 
     }.

encode(#{ 
        }) ->
    #{ 
     }.
