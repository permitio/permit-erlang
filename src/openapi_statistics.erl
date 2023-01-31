-module(openapi_statistics).

-export([encode/1]).

-export_type([openapi_statistics/0]).

-type openapi_statistics() ::
    #{ 'roles' := integer(),
       'users' := integer(),
       'policies' := integer(),
       'resources' := integer(),
       'tenants' := integer(),
       'has_decision_logs' := boolean()
     }.

encode(#{ 'roles' := Roles,
          'users' := Users,
          'policies' := Policies,
          'resources' := Resources,
          'tenants' := Tenants,
          'has_decision_logs' := HasDecisionLogs
        }) ->
    #{ 'roles' => Roles,
       'users' => Users,
       'policies' => Policies,
       'resources' => Resources,
       'tenants' => Tenants,
       'has_decision_logs' => HasDecisionLogs
     }.
