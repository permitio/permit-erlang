-module(openapi_project_create).

-export([encode/1]).

-export_type([openapi_project_create/0]).

-type openapi_project_create() ::
    #{ 'key' := binary(),
       'urn_namespace' => binary(),
       'name' := binary(),
       'description' => binary(),
       'settings' => maps:map(),
       'active_policy_repo_id' => openapi_u_uid:openapi_u_uid()
     }.

encode(#{ 'key' := Key,
          'urn_namespace' := UrnNamespace,
          'name' := Name,
          'description' := Description,
          'settings' := Settings,
          'active_policy_repo_id' := ActivePolicyRepoId
        }) ->
    #{ 'key' => Key,
       'urn_namespace' => UrnNamespace,
       'name' => Name,
       'description' => Description,
       'settings' => Settings,
       'active_policy_repo_id' => ActivePolicyRepoId
     }.
