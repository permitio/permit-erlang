-module(openapi_elements_user_role_remove).

-export([encode/1]).

-export_type([openapi_elements_user_role_remove/0]).

-type openapi_elements_user_role_remove() ::
    #{ 'role' := binary()
     }.

encode(#{ 'role' := Role
        }) ->
    #{ 'role' => Role
     }.
