-module(openapi_resource_action_create).

-export([encode/1]).

-export_type([openapi_resource_action_create/0]).

-type openapi_resource_action_create() ::
    #{ 'key' := binary(),
       'name' := binary(),
       'description' => binary()
     }.

encode(#{ 'key' := Key,
          'name' := Name,
          'description' := Description
        }) ->
    #{ 'key' => Key,
       'name' => Name,
       'description' => Description
     }.
