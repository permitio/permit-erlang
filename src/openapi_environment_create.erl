-module(openapi_environment_create).

-export([encode/1]).

-export_type([openapi_environment_create/0]).

-type openapi_environment_create() ::
    #{ 'key' := binary(),
       'name' := binary(),
       'description' => binary(),
       'custom_branch_name' => binary()
     }.

encode(#{ 'key' := Key,
          'name' := Name,
          'description' := Description,
          'custom_branch_name' := CustomBranchName
        }) ->
    #{ 'key' => Key,
       'name' => Name,
       'description' => Description,
       'custom_branch_name' => CustomBranchName
     }.
