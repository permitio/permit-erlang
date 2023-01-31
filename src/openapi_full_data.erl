-module(openapi_full_data).

-export([encode/1]).

-export_type([openapi_full_data/0]).

-type openapi_full_data() ::
    #{ 'users' := maps:map(),
       'roles' := maps:map(),
       'condition_set_rules' := maps:map()
     }.

encode(#{ 'users' := Users,
          'roles' := Roles,
          'condition_set_rules' := ConditionSetRules
        }) ->
    #{ 'users' => Users,
       'roles' => Roles,
       'condition_set_rules' => ConditionSetRules
     }.
