-module(openapi_resource_attribute_create).

-export([encode/1]).

-export_type([openapi_resource_attribute_create/0]).

-type openapi_resource_attribute_create() ::
    #{ 'key' := binary(),
       'type' := openapi_attribute_type:openapi_attribute_type(),
       'description' => binary()
     }.

encode(#{ 'key' := Key,
          'type' := Type,
          'description' := Description
        }) ->
    #{ 'key' => Key,
       'type' => Type,
       'description' => Description
     }.
