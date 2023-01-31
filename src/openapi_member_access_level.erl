-module(openapi_member_access_level).

-export([encode/1]).

-export_type([openapi_member_access_level/0]).

-type openapi_member_access_level() ::
    #{ 
     }.

encode(#{ 
        }) ->
    #{ 
     }.
