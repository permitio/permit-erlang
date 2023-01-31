-module(openapi_api_key_create).

-export([encode/1]).

-export_type([openapi_api_key_create/0]).

-type openapi_api_key_create() ::
    #{ 'organization_id' := openapi_u_uid:openapi_u_uid(),
       'project_id' => openapi_u_uid:openapi_u_uid(),
       'environment_id' => openapi_u_uid:openapi_u_uid(),
       'object_type' => openapi_member_access_obj:openapi_member_access_obj(),
       'access_level' => openapi_member_access_level:openapi_member_access_level(),
       'owner_type' => openapi_a_pi_key_owner_type:openapi_a_pi_key_owner_type()
     }.

encode(#{ 'organization_id' := OrganizationId,
          'project_id' := ProjectId,
          'environment_id' := EnvironmentId,
          'object_type' := ObjectType,
          'access_level' := AccessLevel,
          'owner_type' := OwnerType
        }) ->
    #{ 'organization_id' => OrganizationId,
       'project_id' => ProjectId,
       'environment_id' => EnvironmentId,
       'object_type' => ObjectType,
       'access_level' => AccessLevel,
       'owner_type' => OwnerType
     }.
