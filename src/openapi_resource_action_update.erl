-module(openapi_resource_action_update).

-export([encode/1]).

-export_type([openapi_resource_action_update/0]).

-type openapi_resource_action_update() ::
    #{ 'name' => binary(),
       'description' => binary()
     }.

encode(#{ 'name' := Name,
          'description' := Description
        }) ->
    #{ 'name' => Name,
       'description' => Description
     }.
