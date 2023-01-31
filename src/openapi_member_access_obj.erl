-module(openapi_member_access_obj).

-export([encode/1]).

-export_type([openapi_member_access_obj/0]).

-type openapi_member_access_obj() ::
    #{ 
     }.

encode(#{ 
        }) ->
    #{ 
     }.
