-module(openapi_user_role).

-export([encode/1]).

-export_type([openapi_user_role/0]).

-type openapi_user_role() ::
    #{ 'role' := binary(),
       'tenant' := binary()
     }.

encode(#{ 'role' := Role,
          'tenant' := Tenant
        }) ->
    #{ 'role' => Role,
       'tenant' => Tenant
     }.
