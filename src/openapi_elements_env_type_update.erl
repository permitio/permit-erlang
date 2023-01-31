-module(openapi_elements_env_type_update).

-export([encode/1]).

-export_type([openapi_elements_env_type_update/0]).

-type openapi_elements_env_type_update() ::
    #{ 'roles_to_levels' => maps:map()
     }.

encode(#{ 'roles_to_levels' := RolesToLevels
        }) ->
    #{ 'roles_to_levels' => RolesToLevels
     }.
