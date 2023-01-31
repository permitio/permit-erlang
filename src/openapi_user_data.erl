-module(openapi_user_data).

-export([encode/1]).

-export_type([openapi_user_data/0]).

-type openapi_user_data() ::
    #{ 'roleAssignments' => maps:map(),
       'attributes' => maps:map()
     }.

encode(#{ 'roleAssignments' := RoleAssignments,
          'attributes' := Attributes
        }) ->
    #{ 'roleAssignments' => RoleAssignments,
       'attributes' => Attributes
     }.
