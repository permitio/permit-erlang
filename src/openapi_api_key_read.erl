-module(openapi_api_key_read).

-export([encode/1]).

-export_type([openapi_api_key_read/0]).

-type openapi_api_key_read() ::
    #{ 'organization_id' := openapi_u_uid:openapi_u_uid(),
       'project_id' => openapi_u_uid:openapi_u_uid(),
       'environment_id' => openapi_u_uid:openapi_u_uid(),
       'object_type' => openapi_member_access_obj:openapi_member_access_obj(),
       'access_level' => openapi_member_access_level:openapi_member_access_level(),
       'owner_type' := openapi_a_pi_key_owner_type:openapi_a_pi_key_owner_type(),
       'id' := openapi_u_uid:openapi_u_uid(),
       'secret' => binary(),
       'created_at' := openapi_date_time:openapi_date_time(),
       'created_by_member' => openapi_org_member_read:openapi_org_member_read(),
       'last_used_at' => openapi_date_time:openapi_date_time()
     }.

encode(#{ 'organization_id' := OrganizationId,
          'project_id' := ProjectId,
          'environment_id' := EnvironmentId,
          'object_type' := ObjectType,
          'access_level' := AccessLevel,
          'owner_type' := OwnerType,
          'id' := Id,
          'secret' := Secret,
          'created_at' := CreatedAt,
          'created_by_member' := CreatedByMember,
          'last_used_at' := LastUsedAt
        }) ->
    #{ 'organization_id' => OrganizationId,
       'project_id' => ProjectId,
       'environment_id' => EnvironmentId,
       'object_type' => ObjectType,
       'access_level' => AccessLevel,
       'owner_type' => OwnerType,
       'id' => Id,
       'secret' => Secret,
       'created_at' => CreatedAt,
       'created_by_member' => CreatedByMember,
       'last_used_at' => LastUsedAt
     }.
