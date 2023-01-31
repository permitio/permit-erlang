-module(openapi_user_role_create).

-export([encode/1]).

-export_type([openapi_user_role_create/0]).

-type openapi_user_role_create() ::
    #{ 'role' := binary(),
       'tenant' := binary()
     }.

encode(#{ 'role' := Role,
          'tenant' := Tenant
        }) ->
    #{ 'role' => Role,
       'tenant' => Tenant
     }.
