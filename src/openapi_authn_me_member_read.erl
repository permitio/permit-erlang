-module(openapi_authn_me_member_read).

-export([encode/1]).

-export_type([openapi_authn_me_member_read/0]).

-type openapi_authn_me_member_read() ::
    #{ 'actor_type' => binary(),
       'id' := openapi_u_uid:openapi_u_uid(),
       'email' := binary(),
       'name' => binary(),
       'given_name' => binary(),
       'family_name' => binary(),
       'picture' => binary(),
       'is_onboarding' := boolean(),
       'onboarding_step' := openapi_onboarding_step:openapi_onboarding_step()
     }.

encode(#{ 'actor_type' := ActorType,
          'id' := Id,
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
       'email' => Email,
       'name' => Name,
       'given_name' => GivenName,
       'family_name' => FamilyName,
       'picture' => Picture,
       'is_onboarding' => IsOnboarding,
       'onboarding_step' => OnboardingStep
     }.
