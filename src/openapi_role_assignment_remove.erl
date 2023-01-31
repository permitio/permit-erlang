-module(openapi_role_assignment_remove).

-export([encode/1]).

-export_type([openapi_role_assignment_remove/0]).

-type openapi_role_assignment_remove() ::
    #{ 'role' := binary(),
       'tenant' := binary(),
       'user' := binary()
     }.

encode(#{ 'role' := Role,
          'tenant' := Tenant,
          'user' := User
        }) ->
    #{ 'role' => Role,
       'tenant' => Tenant,
       'user' => User
     }.
