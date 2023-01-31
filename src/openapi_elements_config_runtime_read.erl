-module(openapi_elements_config_runtime_read).

-export([encode/1]).

-export_type([openapi_elements_config_runtime_read/0]).

-type openapi_elements_config_runtime_read() ::
    #{ 'config' := openapi_elements_config_read:openapi_elements_config_read(),
       'current_permission_level' := openapi_elements_permission_level:openapi_elements_permission_level()
     }.

encode(#{ 'config' := Config,
          'current_permission_level' := CurrentPermissionLevel
        }) ->
    #{ 'config' => Config,
       'current_permission_level' => CurrentPermissionLevel
     }.
