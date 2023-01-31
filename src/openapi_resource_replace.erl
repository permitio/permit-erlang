-module(openapi_resource_replace).

-export([encode/1]).

-export_type([openapi_resource_replace/0]).

-type openapi_resource_replace() ::
    #{ 'name' := binary(),
       'urn' => binary(),
       'description' => binary(),
       'actions' := maps:map(),
       'attributes' => maps:map()
     }.

encode(#{ 'name' := Name,
          'urn' := Urn,
          'description' := Description,
          'actions' := Actions,
          'attributes' := Attributes
        }) ->
    #{ 'name' => Name,
       'urn' => Urn,
       'description' => Description,
       'actions' => Actions,
       'attributes' => Attributes
     }.
