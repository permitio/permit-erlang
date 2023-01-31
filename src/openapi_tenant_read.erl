-module(openapi_tenant_read).

-export([encode/1]).

-export_type([openapi_tenant_read/0]).

-type openapi_tenant_read() ::
    #{ 'key' := binary(),
       'id' := openapi_u_uid:openapi_u_uid(),
       'organization_id' := openapi_u_uid:openapi_u_uid(),
       'project_id' := openapi_u_uid:openapi_u_uid(),
       'environment_id' := openapi_u_uid:openapi_u_uid(),
       'created_at' := openapi_date_time:openapi_date_time(),
       'updated_at' := openapi_date_time:openapi_date_time(),
       'last_action_at' := openapi_date_time:openapi_date_time(),
       'name' := binary(),
       'description' => binary(),
       'attributes' => maps:map()
     }.

encode(#{ 'key' := Key,
          'id' := Id,
          'organization_id' := OrganizationId,
          'project_id' := ProjectId,
          'environment_id' := EnvironmentId,
          'created_at' := CreatedAt,
          'updated_at' := UpdatedAt,
          'last_action_at' := LastActionAt,
          'name' := Name,
          'description' := Description,
          'attributes' := Attributes
        }) ->
    #{ 'key' => Key,
       'id' => Id,
       'organization_id' => OrganizationId,
       'project_id' => ProjectId,
       'environment_id' => EnvironmentId,
       'created_at' => CreatedAt,
       'updated_at' => UpdatedAt,
       'last_action_at' => LastActionAt,
       'name' => Name,
       'description' => Description,
       'attributes' => Attributes
     }.
