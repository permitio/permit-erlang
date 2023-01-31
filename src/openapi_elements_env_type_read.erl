-module(openapi_elements_env_type_read).

-export([encode/1]).

-export_type([openapi_elements_env_type_read/0]).

-type openapi_elements_env_type_read() ::
    #{ 'roles_to_levels' := maps:map(),
       'elements_type' := binary()
     }.

encode(#{ 'roles_to_levels' := RolesToLevels,
          'elements_type' := ElementsType
        }) ->
    #{ 'roles_to_levels' => RolesToLevels,
       'elements_type' => ElementsType
     }.
