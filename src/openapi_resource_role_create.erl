-module(openapi_resource_role_create).

-export([encode/1]).

-export_type([openapi_resource_role_create/0]).

-type openapi_resource_role_create() ::
    #{ 'key' := binary(),
       'name' := binary(),
       'description' => binary(),
       'permissions' => list(),
       'extends' => list()
     }.

encode(#{ 'key' := Key,
          'name' := Name,
          'description' := Description,
          'permissions' := Permissions,
          'extends' := Extends
        }) ->
    #{ 'key' => Key,
       'name' => Name,
       'description' => Description,
       'permissions' => Permissions,
       'extends' => Extends
     }.
