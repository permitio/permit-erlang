-module(openapi_tenant_create).

-export([encode/1]).

-export_type([openapi_tenant_create/0]).

-type openapi_tenant_create() ::
    #{ 'key' := binary(),
       'name' := binary(),
       'description' => binary(),
       'attributes' => maps:map()
     }.

encode(#{ 'key' := Key,
          'name' := Name,
          'description' := Description,
          'attributes' := Attributes
        }) ->
    #{ 'key' => Key,
       'name' => Name,
       'description' => Description,
       'attributes' => Attributes
     }.
