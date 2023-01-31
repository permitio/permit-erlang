-module(openapi_org_member_read).

-export([encode/1]).

-export_type([openapi_org_member_read/0]).

-type openapi_org_member_read() ::
    #{ 'id' := openapi_u_uid:openapi_u_uid(),
       'email' := binary(),
       'email_verified' := boolean(),
       'name' => binary(),
       'given_name' => binary(),
       'family_name' => binary(),
       'picture' => binary(),
       'is_superuser' := boolean(),
       'is_onboarding' := boolean(),
       'onboarding_step' := openapi_onboarding_step:openapi_onboarding_step(),
       'created_at' := openapi_date_time:openapi_date_time(),
       'last_login' => openapi_date_time:openapi_date_time(),
       'last_ip' => binary(),
       'logins_count' => integer(),
       'identities' := list(),
       'settings' := maps:map()
     }.

encode(#{ 'id' := Id,
          'email' := Email,
          'email_verified' := EmailVerified,
          'name' := Name,
          'given_name' := GivenName,
          'family_name' := FamilyName,
          'picture' := Picture,
          'is_superuser' := IsSuperuser,
          'is_onboarding' := IsOnboarding,
          'onboarding_step' := OnboardingStep,
          'created_at' := CreatedAt,
          'last_login' := LastLogin,
          'last_ip' := LastIp,
          'logins_count' := LoginsCount,
          'identities' := Identities,
          'settings' := Settings
        }) ->
    #{ 'id' => Id,
       'email' => Email,
       'email_verified' => EmailVerified,
       'name' => Name,
       'given_name' => GivenName,
       'family_name' => FamilyName,
       'picture' => Picture,
       'is_superuser' => IsSuperuser,
       'is_onboarding' => IsOnboarding,
       'onboarding_step' => OnboardingStep,
       'created_at' => CreatedAt,
       'last_login' => LastLogin,
       'last_ip' => LastIp,
       'logins_count' => LoginsCount,
       'identities' => Identities,
       'settings' => Settings
     }.
