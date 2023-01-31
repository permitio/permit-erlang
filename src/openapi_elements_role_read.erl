-module(openapi_elements_role_read).

-export([encode/1]).

-export_type([openapi_elements_role_read/0]).

-type openapi_elements_role_read() ::
    #{ 'name' := binary(),
       'description' => binary(),
       'permissions' => list(),
       'extends' => list(),
       'key' := binary(),
       'id' := openapi_u_uid:openapi_u_uid(),
       'organization_id' := openapi_u_uid:openapi_u_uid(),
       'project_id' := openapi_u_uid:openapi_u_uid(),
       'environment_id' := openapi_u_uid:openapi_u_uid(),
       'created_at' := openapi_date_time:openapi_date_time(),
       'updated_at' := openapi_date_time:openapi_date_time(),
       'permission_level' := openapi_elements_permission_level:openapi_elements_permission_level()
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
          'created_at' := CreatedAt,
          'updated_at' := UpdatedAt,
          'permission_level' := PermissionLevel
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
       'created_at' => CreatedAt,
       'updated_at' => UpdatedAt,
       'permission_level' => PermissionLevel
     }.
