-module(openapi_elements_config_create).

-export([encode/1]).

-export_type([openapi_elements_config_create/0]).

-type openapi_elements_config_create() ::
    #{ 'key' := binary(),
       'name' := binary(),
       'elements_type' := openapi_elements_type:openapi_elements_type(),
       'settings' := maps:map(),
       'roles_to_levels' := maps:map(),
       'webhook' => openapi_webhook_create:openapi_webhook_create()
     }.

encode(#{ 'key' := Key,
          'name' := Name,
          'elements_type' := ElementsType,
          'settings' := Settings,
          'roles_to_levels' := RolesToLevels,
          'webhook' := Webhook
        }) ->
    #{ 'key' => Key,
       'name' => Name,
       'elements_type' => ElementsType,
       'settings' => Settings,
       'roles_to_levels' => RolesToLevels,
       'webhook' => Webhook
     }.
