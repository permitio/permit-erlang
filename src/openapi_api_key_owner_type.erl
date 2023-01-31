-module(openapi_api_key_owner_type).

-export([encode/1]).

-export_type([openapi_api_key_owner_type/0]).

-type openapi_api_key_owner_type() ::
    #{ 
     }.

encode(#{ 
        }) ->
    #{ 
     }.
