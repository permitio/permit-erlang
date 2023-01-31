-module(openapi_resource_create).

-export([encode/1]).

-export_type([openapi_resource_create/0]).

-type openapi_resource_create() ::
    #{ 'key' := binary(),
       'name' := binary(),
       'urn' => binary(),
       'description' => binary(),
       'actions' := maps:map(),
       'attributes' => maps:map()
     }.

encode(#{ 'key' := Key,
          'name' := Name,
          'urn' := Urn,
          'description' := Description,
          'actions' := Actions,
          'attributes' := Attributes
        }) ->
    #{ 'key' => Key,
       'name' => Name,
       'urn' => Urn,
       'description' => Description,
       'actions' => Actions,
       'attributes' => Attributes
     }.
