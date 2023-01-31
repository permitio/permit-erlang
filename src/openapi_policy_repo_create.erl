-module(openapi_policy_repo_create).

-export([encode/1]).

-export_type([openapi_policy_repo_create/0]).

-type openapi_policy_repo_create() ::
    #{ 'key' := binary(),
       'url' := binary(),
       'main_branch_name' => binary(),
       'credentials' := openapi_s_sh_auth_data:openapi_s_sh_auth_data(),
       'activate_when_validated' => boolean()
     }.

encode(#{ 'key' := Key,
          'url' := Url,
          'main_branch_name' := MainBranchName,
          'credentials' := Credentials,
          'activate_when_validated' := ActivateWhenValidated
        }) ->
    #{ 'key' => Key,
       'url' => Url,
       'main_branch_name' => MainBranchName,
       'credentials' => Credentials,
       'activate_when_validated' => ActivateWhenValidated
     }.
