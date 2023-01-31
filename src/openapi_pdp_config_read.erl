-module(openapi_pdp_config_read).

-export([encode/1]).

-export_type([openapi_pdp_config_read/0]).

-type openapi_pdp_config_read() ::
    #{ 'id' := openapi_u_uid:openapi_u_uid(),
       'name' => binary(),
       'organization_id' := openapi_u_uid:openapi_u_uid(),
       'project_id' := openapi_u_uid:openapi_u_uid(),
       'environment_id' := openapi_u_uid:openapi_u_uid(),
       'client_secret' := binary()
     }.

encode(#{ 'id' := Id,
          'name' := Name,
          'organization_id' := OrganizationId,
          'project_id' := ProjectId,
          'environment_id' := EnvironmentId,
          'client_secret' := ClientSecret
        }) ->
    #{ 'id' => Id,
       'name' => Name,
       'organization_id' => OrganizationId,
       'project_id' => ProjectId,
       'environment_id' => EnvironmentId,
       'client_secret' => ClientSecret
     }.
