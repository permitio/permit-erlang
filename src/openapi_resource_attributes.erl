-module(openapi_resource_attributes).

-export([encode/1]).

-export_type([openapi_resource_attributes/0]).

-type openapi_resource_attributes() ::
    #{ 'type' := openapi_attribute_type:openapi_attribute_type(),
       'key' := binary()
     }.

encode(#{ 'type' := Type,
          'key' := Key
        }) ->
    #{ 'type' => Type,
       'key' => Key
     }.
