-module(openapi_condition_set_rule_read).

-export([encode/1]).

-export_type([openapi_condition_set_rule_read/0]).

-type openapi_condition_set_rule_read() ::
    #{ 'id' := openapi_u_uid:openapi_u_uid(),
       'key' := binary(),
       'user_set' := binary(),
       'permission' := binary(),
       'resource_set' := binary(),
       'organization_id' := openapi_u_uid:openapi_u_uid(),
       'project_id' := openapi_u_uid:openapi_u_uid(),
       'environment_id' := openapi_u_uid:openapi_u_uid(),
       'created_at' := openapi_date_time:openapi_date_time(),
       'updated_at' := openapi_date_time:openapi_date_time()
     }.

encode(#{ 'id' := Id,
          'key' := Key,
          'user_set' := UserSet,
          'permission' := Permission,
          'resource_set' := ResourceSet,
          'organization_id' := OrganizationId,
          'project_id' := ProjectId,
          'environment_id' := EnvironmentId,
          'created_at' := CreatedAt,
          'updated_at' := UpdatedAt
        }) ->
    #{ 'id' => Id,
       'key' => Key,
       'user_set' => UserSet,
       'permission' => Permission,
       'resource_set' => ResourceSet,
       'organization_id' => OrganizationId,
       'project_id' => ProjectId,
       'environment_id' => EnvironmentId,
       'created_at' => CreatedAt,
       'updated_at' => UpdatedAt
     }.
