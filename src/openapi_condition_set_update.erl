-module(openapi_condition_set_update).

-export([encode/1]).

-export_type([openapi_condition_set_update/0]).

-type openapi_condition_set_update() ::
    #{ 'name' => binary(),
       'description' => binary(),
       'conditions' => maps:map()
     }.

encode(#{ 'name' := Name,
          'description' := Description,
          'conditions' := Conditions
        }) ->
    #{ 'name' => Name,
       'description' => Description,
       'conditions' => Conditions
     }.
