-module(openapi_resource_action_read).

-export([encode/1]).

-export_type([openapi_resource_action_read/0]).

-type openapi_resource_action_read() ::
    #{ 'name' := binary(),
       'description' => binary(),
       'key' := binary(),
       'id' := openapi_u_uid:openapi_u_uid(),
       'permission_name' := binary(),
       'organization_id' := openapi_u_uid:openapi_u_uid(),
       'project_id' := openapi_u_uid:openapi_u_uid(),
       'environment_id' := openapi_u_uid:openapi_u_uid(),
       'resource_id' := openapi_u_uid:openapi_u_uid(),
       'created_at' := openapi_date_time:openapi_date_time(),
       'updated_at' := openapi_date_time:openapi_date_time()
     }.

encode(#{ 'name' := Name,
          'description' := Description,
          'key' := Key,
          'id' := Id,
          'permission_name' := PermissionName,
          'organization_id' := OrganizationId,
          'project_id' := ProjectId,
          'environment_id' := EnvironmentId,
          'resource_id' := ResourceId,
          'created_at' := CreatedAt,
          'updated_at' := UpdatedAt
        }) ->
    #{ 'name' => Name,
       'description' => Description,
       'key' => Key,
       'id' => Id,
       'permission_name' => PermissionName,
       'organization_id' => OrganizationId,
       'project_id' => ProjectId,
       'environment_id' => EnvironmentId,
       'resource_id' => ResourceId,
       'created_at' => CreatedAt,
       'updated_at' => UpdatedAt
     }.
