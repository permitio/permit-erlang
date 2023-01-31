-module(openapi_settings).

-export([encode/1]).

-export_type([openapi_settings/0]).

-type openapi_settings() ::
    #{ 
     }.

encode(#{ 
        }) ->
    #{ 
     }.
