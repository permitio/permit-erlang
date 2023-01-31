-module(openapi_actor).

-export([encode/1]).

-export_type([openapi_actor/0]).

-type openapi_actor() ::
    #{ 'actor_type' => binary(),
       'id' := openapi_u_uid:openapi_u_uid(),
       'email' := binary(),
       'name' => binary(),
       'given_name' => binary(),
       'family_name' => binary(),
       'picture' => binary(),
       'is_onboarding' := boolean(),
       'onboarding_step' := binary(),
       'key' := binary(),
       'org_id' := openapi_u_uid:openapi_u_uid(),
       'project_id' := openapi_u_uid:openapi_u_uid(),
       'env_id' := openapi_u_uid:openapi_u_uid(),
       'tenant_id' := openapi_u_uid:openapi_u_uid(),
       'object_type' := openapi_member_access_obj:openapi_member_access_obj(),
       'owner_type' := openapi_a_pi_key_owner_type:openapi_a_pi_key_owner_type()
     }.

encode(#{ 'actor_type' := ActorType,
          'id' := Id,
          'email' := Email,
          'name' := Name,
          'given_name' := GivenName,
          'family_name' := FamilyName,
          'picture' := Picture,
          'is_onboarding' := IsOnboarding,
          'onboarding_step' := OnboardingStep,
          'key' := Key,
          'org_id' := OrgId,
          'project_id' := ProjectId,
          'env_id' := EnvId,
          'tenant_id' := TenantId,
          'object_type' := ObjectType,
          'owner_type' := OwnerType
        }) ->
    #{ 'actor_type' => ActorType,
       'id' => Id,
       'email' => Email,
       'name' => Name,
       'given_name' => GivenName,
       'family_name' => FamilyName,
       'picture' => Picture,
       'is_onboarding' => IsOnboarding,
       'onboarding_step' => OnboardingStep,
       'key' => Key,
       'org_id' => OrgId,
       'project_id' => ProjectId,
       'env_id' => EnvId,
       'tenant_id' => TenantId,
       'object_type' => ObjectType,
       'owner_type' => OwnerType
     }.
