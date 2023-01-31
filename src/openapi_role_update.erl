-module(openapi_role_update).

-export([encode/1]).

-export_type([openapi_role_update/0]).

-type openapi_role_update() ::
    #{ 'name' => binary(),
       'description' => binary(),
       'permissions' => list(),
       'extends' => list()
     }.

encode(#{ 'name' := Name,
          'description' := Description,
          'permissions' := Permissions,
          'extends' := Extends
        }) ->
    #{ 'name' => Name,
       'description' => Description,
       'permissions' => Permissions,
       'extends' => Extends
     }.
