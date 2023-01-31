-module(openapi_project_update).

-export([encode/1]).

-export_type([openapi_project_update/0]).

-type openapi_project_update() ::
    #{ 'name' => binary(),
       'description' => binary(),
       'settings' => maps:map(),
       'active_policy_repo_id' => openapi_u_uid:openapi_u_uid()
     }.

encode(#{ 'name' := Name,
          'description' := Description,
          'settings' := Settings,
          'active_policy_repo_id' := ActivePolicyRepoId
        }) ->
    #{ 'name' => Name,
       'description' => Description,
       'settings' => Settings,
       'active_policy_repo_id' => ActivePolicyRepoId
     }.
