-module(openapi_resource_instance_update).

-export([encode/1]).

-export_type([openapi_resource_instance_update/0]).

-type openapi_resource_instance_update() ::
    #{ 'attributes' => maps:map()
     }.

encode(#{ 'attributes' := Attributes
        }) ->
    #{ 'attributes' => Attributes
     }.
