-module(openapi_role_assignment_read).

-export([encode/1]).

-export_type([openapi_role_assignment_read/0]).

-type openapi_role_assignment_read() ::
    #{ 'id' := openapi_u_uid:openapi_u_uid(),
       'user' := binary(),
       'role' := binary(),
       'tenant' := binary(),
       'user_id' := openapi_u_uid:openapi_u_uid(),
       'role_id' := openapi_u_uid:openapi_u_uid(),
       'tenant_id' := openapi_u_uid:openapi_u_uid(),
       'organization_id' := openapi_u_uid:openapi_u_uid(),
       'project_id' := openapi_u_uid:openapi_u_uid(),
       'environment_id' := openapi_u_uid:openapi_u_uid(),
       'created_at' := openapi_date_time:openapi_date_time()
     }.

encode(#{ 'id' := Id,
          'user' := User,
          'role' := Role,
          'tenant' := Tenant,
          'user_id' := UserId,
          'role_id' := RoleId,
          'tenant_id' := TenantId,
          'organization_id' := OrganizationId,
          'project_id' := ProjectId,
          'environment_id' := EnvironmentId,
          'created_at' := CreatedAt
        }) ->
    #{ 'id' => Id,
       'user' => User,
       'role' => Role,
       'tenant' => Tenant,
       'user_id' => UserId,
       'role_id' => RoleId,
       'tenant_id' => TenantId,
       'organization_id' => OrganizationId,
       'project_id' => ProjectId,
       'environment_id' => EnvironmentId,
       'created_at' => CreatedAt
     }.
