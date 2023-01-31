-module(openapi_role_data).

-export([encode/1]).

-export_type([openapi_role_data/0]).

-type openapi_role_data() ::
    #{ 'grants' => maps:map()
     }.

encode(#{ 'grants' := Grants
        }) ->
    #{ 'grants' => Grants
     }.
