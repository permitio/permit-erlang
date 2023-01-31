-module(openapi_resource_attribute_read).

-export([encode/1]).

-export_type([openapi_resource_attribute_read/0]).

-type openapi_resource_attribute_read() ::
    #{ 'type' := openapi_attribute_type:openapi_attribute_type(),
       'description' => binary(),
       'key' := binary(),
       'id' := openapi_u_uid:openapi_u_uid(),
       'resource_id' := openapi_u_uid:openapi_u_uid(),
       'resource_key' := binary(),
       'organization_id' := openapi_u_uid:openapi_u_uid(),
       'project_id' := openapi_u_uid:openapi_u_uid(),
       'environment_id' := openapi_u_uid:openapi_u_uid(),
       'created_at' := openapi_date_time:openapi_date_time(),
       'updated_at' := openapi_date_time:openapi_date_time()
     }.

encode(#{ 'type' := Type,
          'description' := Description,
          'key' := Key,
          'id' := Id,
          'resource_id' := ResourceId,
          'resource_key' := ResourceKey,
          'organization_id' := OrganizationId,
          'project_id' := ProjectId,
          'environment_id' := EnvironmentId,
          'created_at' := CreatedAt,
          'updated_at' := UpdatedAt
        }) ->
    #{ 'type' => Type,
       'description' => Description,
       'key' => Key,
       'id' => Id,
       'resource_id' => ResourceId,
       'resource_key' => ResourceKey,
       'organization_id' => OrganizationId,
       'project_id' => ProjectId,
       'environment_id' => EnvironmentId,
       'created_at' => CreatedAt,
       'updated_at' => UpdatedAt
     }.
