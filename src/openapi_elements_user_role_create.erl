-module(openapi_elements_user_role_create).

-export([encode/1]).

-export_type([openapi_elements_user_role_create/0]).

-type openapi_elements_user_role_create() ::
    #{ 'role' := binary()
     }.

encode(#{ 'role' := Role
        }) ->
    #{ 'role' => Role
     }.
