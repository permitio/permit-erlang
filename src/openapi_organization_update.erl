-module(openapi_organization_update).

-export([encode/1]).

-export_type([openapi_organization_update/0]).

-type openapi_organization_update() ::
    #{ 'name' => binary(),
       'settings' => maps:map()
     }.

encode(#{ 'name' := Name,
          'settings' := Settings
        }) ->
    #{ 'name' => Name,
       'settings' => Settings
     }.
