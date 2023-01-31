-module(openapi_authn_me_api_key_read).

-export([encode/1]).

-export_type([openapi_authn_me_api_key_read/0]).

-type openapi_authn_me_api_key_read() ::
    #{ 'actor_type' => binary(),
       'id' := openapi_u_uid:openapi_u_uid(),
       'object_type' := openapi_member_access_obj:openapi_member_access_obj(),
       'owner_type' := openapi_a_pi_key_owner_type:openapi_a_pi_key_owner_type(),
       'org_id' := openapi_u_uid:openapi_u_uid(),
       'project_id' => openapi_u_uid:openapi_u_uid(),
       'env_id' => openapi_u_uid:openapi_u_uid()
     }.

encode(#{ 'actor_type' := ActorType,
          'id' := Id,
          'object_type' := ObjectType,
          'owner_type' := OwnerType,
          'org_id' := OrgId,
          'project_id' := ProjectId,
          'env_id' := EnvId
        }) ->
    #{ 'actor_type' => ActorType,
       'id' => Id,
       'object_type' => ObjectType,
       'owner_type' => OwnerType,
       'org_id' => OrgId,
       'project_id' => ProjectId,
       'env_id' => EnvId
     }.
