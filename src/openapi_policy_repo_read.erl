-module(openapi_policy_repo_read).

-export([encode/1]).

-export_type([openapi_policy_repo_read/0]).

-type openapi_policy_repo_read() ::
    #{ 'id' := openapi_u_uid:openapi_u_uid(),
       'status' := openapi_policy_repo_status:openapi_policy_repo_status(),
       'key' := binary(),
       'url' := binary(),
       'main_branch_name' => binary(),
       'credentials' := openapi_s_sh_auth_data:openapi_s_sh_auth_data(),
       'activate_when_validated' => boolean()
     }.

encode(#{ 'id' := Id,
          'status' := Status,
          'key' := Key,
          'url' := Url,
          'main_branch_name' := MainBranchName,
          'credentials' := Credentials,
          'activate_when_validated' := ActivateWhenValidated
        }) ->
    #{ 'id' => Id,
       'status' => Status,
       'key' => Key,
       'url' => Url,
       'main_branch_name' => MainBranchName,
       'credentials' => Credentials,
       'activate_when_validated' => ActivateWhenValidated
     }.
