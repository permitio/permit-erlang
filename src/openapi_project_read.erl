-module(openapi_project_read).

-export([encode/1]).

-export_type([openapi_project_read/0]).

-type openapi_project_read() ::
    #{ 'key' := binary(),
       'urn_namespace' => binary(),
       'id' := openapi_u_uid:openapi_u_uid(),
       'organization_id' := openapi_u_uid:openapi_u_uid(),
       'created_at' := openapi_date_time:openapi_date_time(),
       'updated_at' := openapi_date_time:openapi_date_time(),
       'name' := binary(),
       'description' => binary(),
       'settings' => maps:map(),
       'active_policy_repo_id' => openapi_u_uid:openapi_u_uid()
     }.

encode(#{ 'key' := Key,
          'urn_namespace' := UrnNamespace,
          'id' := Id,
          'organization_id' := OrganizationId,
          'created_at' := CreatedAt,
          'updated_at' := UpdatedAt,
          'name' := Name,
          'description' := Description,
          'settings' := Settings,
          'active_policy_repo_id' := ActivePolicyRepoId
        }) ->
    #{ 'key' => Key,
       'urn_namespace' => UrnNamespace,
       'id' => Id,
       'organization_id' => OrganizationId,
       'created_at' => CreatedAt,
       'updated_at' => UpdatedAt,
       'name' => Name,
       'description' => Description,
       'settings' => Settings,
       'active_policy_repo_id' => ActivePolicyRepoId
     }.
