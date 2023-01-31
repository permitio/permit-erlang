-module(openapi_elements_config_read).

-export([encode/1]).

-export_type([openapi_elements_config_read/0]).

-type openapi_elements_config_read() ::
    #{ 'key' := binary(),
       'id' := openapi_u_uid:openapi_u_uid(),
       'organization_id' := openapi_u_uid:openapi_u_uid(),
       'project_id' := openapi_u_uid:openapi_u_uid(),
       'environment_id' := openapi_u_uid:openapi_u_uid(),
       'created_at' := openapi_date_time:openapi_date_time(),
       'updated_at' := openapi_date_time:openapi_date_time(),
       'is_active' := boolean(),
       'name' := binary(),
       'elements_type' := openapi_elements_type:openapi_elements_type(),
       'settings' := maps:map(),
       'roles_to_levels' := maps:map(),
       'webhook' => openapi_webhook_read:openapi_webhook_read()
     }.

encode(#{ 'key' := Key,
          'id' := Id,
          'organization_id' := OrganizationId,
          'project_id' := ProjectId,
          'environment_id' := EnvironmentId,
          'created_at' := CreatedAt,
          'updated_at' := UpdatedAt,
          'is_active' := IsActive,
          'name' := Name,
          'elements_type' := ElementsType,
          'settings' := Settings,
          'roles_to_levels' := RolesToLevels,
          'webhook' := Webhook
        }) ->
    #{ 'key' => Key,
       'id' => Id,
       'organization_id' => OrganizationId,
       'project_id' => ProjectId,
       'environment_id' => EnvironmentId,
       'created_at' => CreatedAt,
       'updated_at' => UpdatedAt,
       'is_active' => IsActive,
       'name' => Name,
       'elements_type' => ElementsType,
       'settings' => Settings,
       'roles_to_levels' => RolesToLevels,
       'webhook' => Webhook
     }.
