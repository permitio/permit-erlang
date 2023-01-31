-module(openapi_resource_attribute_update).

-export([encode/1]).

-export_type([openapi_resource_attribute_update/0]).

-type openapi_resource_attribute_update() ::
    #{ 'type' => openapi_attribute_type:openapi_attribute_type(),
       'description' => binary()
     }.

encode(#{ 'type' := Type,
          'description' := Description
        }) ->
    #{ 'type' => Type,
       'description' => Description
     }.
