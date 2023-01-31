-module(openapi_resource_read).

-export([encode/1]).

-export_type([openapi_resource_read/0]).

-type openapi_resource_read() ::
    #{ 'key' := binary(),
       'id' := openapi_u_uid:openapi_u_uid(),
       'organization_id' := openapi_u_uid:openapi_u_uid(),
       'project_id' := openapi_u_uid:openapi_u_uid(),
       'environment_id' := openapi_u_uid:openapi_u_uid(),
       'created_at' := openapi_date_time:openapi_date_time(),
       'updated_at' := openapi_date_time:openapi_date_time(),
       'name' := binary(),
       'urn' => binary(),
       'description' => binary(),
       'actions' => maps:map(),
       'attributes' => maps:map()
     }.

encode(#{ 'key' := Key,
          'id' := Id,
          'organization_id' := OrganizationId,
          'project_id' := ProjectId,
          'environment_id' := EnvironmentId,
          'created_at' := CreatedAt,
          'updated_at' := UpdatedAt,
          'name' := Name,
          'urn' := Urn,
          'description' := Description,
          'actions' := Actions,
          'attributes' := Attributes
        }) ->
    #{ 'key' => Key,
       'id' => Id,
       'organization_id' => OrganizationId,
       'project_id' => ProjectId,
       'environment_id' => EnvironmentId,
       'created_at' => CreatedAt,
       'updated_at' => UpdatedAt,
       'name' => Name,
       'urn' => Urn,
       'description' => Description,
       'actions' => Actions,
       'attributes' => Attributes
     }.
