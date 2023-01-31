-module(openapi_user_read).

-export([encode/1]).

-export_type([openapi_user_read/0]).

-type openapi_user_read() ::
    #{ 'key' := binary(),
       'id' := openapi_u_uid:openapi_u_uid(),
       'organization_id' := openapi_u_uid:openapi_u_uid(),
       'project_id' := openapi_u_uid:openapi_u_uid(),
       'environment_id' := openapi_u_uid:openapi_u_uid(),
       'roles' => list(),
       'email' => binary(),
       'first_name' => binary(),
       'last_name' => binary(),
       'attributes' => maps:map()
     }.

encode(#{ 'key' := Key,
          'id' := Id,
          'organization_id' := OrganizationId,
          'project_id' := ProjectId,
          'environment_id' := EnvironmentId,
          'roles' := Roles,
          'email' := Email,
          'first_name' := FirstName,
          'last_name' := LastName,
          'attributes' := Attributes
        }) ->
    #{ 'key' => Key,
       'id' => Id,
       'organization_id' => OrganizationId,
       'project_id' => ProjectId,
       'environment_id' => EnvironmentId,
       'roles' => Roles,
       'email' => Email,
       'first_name' => FirstName,
       'last_name' => LastName,
       'attributes' => Attributes
     }.
