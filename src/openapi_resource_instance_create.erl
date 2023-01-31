-module(openapi_resource_instance_create).

-export([encode/1]).

-export_type([openapi_resource_instance_create/0]).

-type openapi_resource_instance_create() ::
    #{ 'key' := binary(),
       'tenant' => binary(),
       'resource' := binary(),
       'attributes' => maps:map()
     }.

encode(#{ 'key' := Key,
          'tenant' := Tenant,
          'resource' := Resource,
          'attributes' := Attributes
        }) ->
    #{ 'key' => Key,
       'tenant' => Tenant,
       'resource' => Resource,
       'attributes' => Attributes
     }.
