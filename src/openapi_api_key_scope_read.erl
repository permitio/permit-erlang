-module(openapi_api_key_scope_read).

-export([encode/1]).

-export_type([openapi_api_key_scope_read/0]).

-type openapi_api_key_scope_read() ::
    #{ 'organization_id' := openapi_u_uid:openapi_u_uid(),
       'project_id' => openapi_u_uid:openapi_u_uid(),
       'environment_id' => openapi_u_uid:openapi_u_uid()
     }.

encode(#{ 'organization_id' := OrganizationId,
          'project_id' := ProjectId,
          'environment_id' := EnvironmentId
        }) ->
    #{ 'organization_id' => OrganizationId,
       'project_id' => ProjectId,
       'environment_id' => EnvironmentId
     }.
