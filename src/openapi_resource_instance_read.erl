-module(openapi_resource_instance_read).

-export([encode/1]).

-export_type([openapi_resource_instance_read/0]).

-type openapi_resource_instance_read() ::
    #{ 'key' := binary(),
       'tenant' => binary(),
       'resource' := binary(),
       'id' := openapi_u_uid:openapi_u_uid(),
       'organization_id' := openapi_u_uid:openapi_u_uid(),
       'project_id' := openapi_u_uid:openapi_u_uid(),
       'environment_id' := openapi_u_uid:openapi_u_uid(),
       'created_at' := openapi_date_time:openapi_date_time(),
       'updated_at' := openapi_date_time:openapi_date_time(),
       'resource_id' := openapi_u_uid:openapi_u_uid(),
       'tenant_id' => openapi_u_uid:openapi_u_uid(),
       'attributes' => maps:map()
     }.

encode(#{ 'key' := Key,
          'tenant' := Tenant,
          'resource' := Resource,
          'id' := Id,
          'organization_id' := OrganizationId,
          'project_id' := ProjectId,
          'environment_id' := EnvironmentId,
          'created_at' := CreatedAt,
          'updated_at' := UpdatedAt,
          'resource_id' := ResourceId,
          'tenant_id' := TenantId,
          'attributes' := Attributes
        }) ->
    #{ 'key' => Key,
       'tenant' => Tenant,
       'resource' => Resource,
       'id' => Id,
       'organization_id' => OrganizationId,
       'project_id' => ProjectId,
       'environment_id' => EnvironmentId,
       'created_at' => CreatedAt,
       'updated_at' => UpdatedAt,
       'resource_id' => ResourceId,
       'tenant_id' => TenantId,
       'attributes' => Attributes
     }.
