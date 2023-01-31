-module(openapi_role_block).

-export([encode/1]).

-export_type([openapi_role_block/0]).

-type openapi_role_block() ::
    #{ 'description' => binary(),
       'permissions' => list(),
       'extends' => list()
     }.

encode(#{ 'description' := Description,
          'permissions' := Permissions,
          'extends' := Extends
        }) ->
    #{ 'description' => Description,
       'permissions' => Permissions,
       'extends' => Extends
     }.
