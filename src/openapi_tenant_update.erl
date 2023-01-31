-module(openapi_tenant_update).

-export([encode/1]).

-export_type([openapi_tenant_update/0]).

-type openapi_tenant_update() ::
    #{ 'name' => binary(),
       'description' => binary(),
       'attributes' => maps:map()
     }.

encode(#{ 'name' := Name,
          'description' := Description,
          'attributes' := Attributes
        }) ->
    #{ 'name' => Name,
       'description' => Description,
       'attributes' => Attributes
     }.
