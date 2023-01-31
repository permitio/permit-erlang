-module(openapi_authn_me_user_read).

-export([encode/1]).

-export_type([openapi_authn_me_user_read/0]).

-type openapi_authn_me_user_read() ::
    #{ 'actor_type' => binary(),
       'id' := openapi_u_uid:openapi_u_uid(),
       'key' := binary(),
       'org_id' := openapi_u_uid:openapi_u_uid(),
       'project_id' := openapi_u_uid:openapi_u_uid(),
       'env_id' := openapi_u_uid:openapi_u_uid(),
       'tenant_id' := openapi_u_uid:openapi_u_uid(),
       'email' := binary(),
       'name' => binary(),
       'given_name' => binary(),
       'family_name' => binary(),
       'picture' => binary(),
       'is_onboarding' => boolean(),
       'onboarding_step' => binary()
     }.

encode(#{ 'actor_type' := ActorType,
          'id' := Id,
          'key' := Key,
          'org_id' := OrgId,
          'project_id' := ProjectId,
          'env_id' := EnvId,
          'tenant_id' := TenantId,
          'email' := Email,
          'name' := Name,
          'given_name' := GivenName,
          'family_name' := FamilyName,
          'picture' := Picture,
          'is_onboarding' := IsOnboarding,
          'onboarding_step' := OnboardingStep
        }) ->
    #{ 'actor_type' => ActorType,
       'id' => Id,
       'key' => Key,
       'org_id' => OrgId,
       'project_id' => ProjectId,
       'env_id' => EnvId,
       'tenant_id' => TenantId,
       'email' => Email,
       'name' => Name,
       'given_name' => GivenName,
       'family_name' => FamilyName,
       'picture' => Picture,
       'is_onboarding' => IsOnboarding,
       'onboarding_step' => OnboardingStep
     }.
