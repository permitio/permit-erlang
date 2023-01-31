-module(openapi_organization_create).

-export([encode/1]).

-export_type([openapi_organization_create/0]).

-type openapi_organization_create() ::
    #{ 'key' := binary(),
       'name' := binary(),
       'settings' => maps:map()
     }.

encode(#{ 'key' := Key,
          'name' := Name,
          'settings' := Settings
        }) ->
    #{ 'key' => Key,
       'name' => Name,
       'settings' => Settings
     }.
