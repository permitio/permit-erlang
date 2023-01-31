-module(openapi_environment_update).

-export([encode/1]).

-export_type([openapi_environment_update/0]).

-type openapi_environment_update() ::
    #{ 'name' => binary(),
       'description' => binary(),
       'custom_branch_name' => binary()
     }.

encode(#{ 'name' := Name,
          'description' := Description,
          'custom_branch_name' := CustomBranchName
        }) ->
    #{ 'name' => Name,
       'description' => Description,
       'custom_branch_name' => CustomBranchName
     }.
