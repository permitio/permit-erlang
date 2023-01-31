-module(openapi_org_member_update).

-export([encode/1]).

-export_type([openapi_org_member_update/0]).

-type openapi_org_member_update() ::
    #{ 'settings' => maps:map(),
       'onboarding_step' => openapi_onboarding_step:openapi_onboarding_step()
     }.

encode(#{ 'settings' := Settings,
          'onboarding_step' := OnboardingStep
        }) ->
    #{ 'settings' => Settings,
       'onboarding_step' => OnboardingStep
     }.
