-module(openapi_condition_set_rule_create).

-export([encode/1]).

-export_type([openapi_condition_set_rule_create/0]).

-type openapi_condition_set_rule_create() ::
    #{ 'user_set' := binary(),
       'permission' := binary(),
       'resource_set' := binary(),
       'is_role' => boolean(),
       'is_resource' => boolean()
     }.

encode(#{ 'user_set' := UserSet,
          'permission' := Permission,
          'resource_set' := ResourceSet,
          'is_role' := IsRole,
          'is_resource' := IsResource
        }) ->
    #{ 'user_set' => UserSet,
       'permission' => Permission,
       'resource_set' => ResourceSet,
       'is_role' => IsRole,
       'is_resource' => IsResource
     }.
