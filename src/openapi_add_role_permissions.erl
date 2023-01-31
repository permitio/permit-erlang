-module(openapi_add_role_permissions).

-export([encode/1]).

-export_type([openapi_add_role_permissions/0]).

-type openapi_add_role_permissions() ::
    #{ 'permissions' := list()
     }.

encode(#{ 'permissions' := Permissions
        }) ->
    #{ 'permissions' => Permissions
     }.
