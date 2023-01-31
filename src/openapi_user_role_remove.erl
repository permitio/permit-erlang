-module(openapi_user_role_remove).

-export([encode/1]).

-export_type([openapi_user_role_remove/0]).

-type openapi_user_role_remove() ::
    #{ 'role' := binary(),
       'tenant' := binary()
     }.

encode(#{ 'role' := Role,
          'tenant' := Tenant
        }) ->
    #{ 'role' => Role,
       'tenant' => Tenant
     }.
