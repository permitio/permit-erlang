-module(openapi_resource_role_read).

-export([encode/1]).

-export_type([openapi_resource_role_read/0]).

-type openapi_resource_role_read() ::
    #{ 'name' := binary(),
       'description' => binary(),
       'permissions' => list(),
       'extends' => list(),
       'key' := binary(),
       'id' := openapi_u_uid:openapi_u_uid(),
       'organization_id' := openapi_u_uid:openapi_u_uid(),
       'project_id' := openapi_u_uid:openapi_u_uid(),
       'environment_id' := openapi_u_uid:openapi_u_uid(),
       'resource_id' := openapi_u_uid:openapi_u_uid(),
       'created_at' := openapi_date_time:openapi_date_time(),
       'updated_at' := openapi_date_time:openapi_date_time()
     }.

encode(#{ 'name' := Name,
          'description' := Description,
          'permissions' := Permissions,
          'extends' := Extends,
          'key' := Key,
          'id' := Id,
          'organization_id' := OrganizationId,
          'project_id' := ProjectId,
          'environment_id' := EnvironmentId,
          'resource_id' := ResourceId,
          'created_at' := CreatedAt,
          'updated_at' := UpdatedAt
        }) ->
    #{ 'name' => Name,
       'description' => Description,
       'permissions' => Permissions,
       'extends' => Extends,
       'key' => Key,
       'id' => Id,
       'organization_id' => OrganizationId,
       'project_id' => ProjectId,
       'environment_id' => EnvironmentId,
       'resource_id' => ResourceId,
       'created_at' => CreatedAt,
       'updated_at' => UpdatedAt
     }.
