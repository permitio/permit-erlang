-module(openapi_elements_config_update).

-export([encode/1]).

-export_type([openapi_elements_config_update/0]).

-type openapi_elements_config_update() ::
    #{ 'name' => binary(),
       'elements_type' => openapi_elements_type:openapi_elements_type(),
       'settings' => maps:map(),
       'roles_to_levels' := maps:map(),
       'webhook' => openapi_webhook_update:openapi_webhook_update()
     }.

encode(#{ 'name' := Name,
          'elements_type' := ElementsType,
          'settings' := Settings,
          'roles_to_levels' := RolesToLevels,
          'webhook' := Webhook
        }) ->
    #{ 'name' => Name,
       'elements_type' => ElementsType,
       'settings' => Settings,
       'roles_to_levels' => RolesToLevels,
       'webhook' => Webhook
     }.
