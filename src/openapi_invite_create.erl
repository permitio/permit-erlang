-module(openapi_invite_create).

-export([encode/1]).

-export_type([openapi_invite_create/0]).

-type openapi_invite_create() ::
    #{ 'email' := binary(),
       'role' := binary()
     }.

encode(#{ 'email' := Email,
          'role' := Role
        }) ->
    #{ 'email' => Email,
       'role' => Role
     }.
