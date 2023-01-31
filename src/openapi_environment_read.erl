-module(openapi_environment_read).

-export([encode/1]).

-export_type([openapi_environment_read/0]).

-type openapi_environment_read() ::
    #{ 'key' := binary(),
       'id' := openapi_u_uid:openapi_u_uid(),
       'organization_id' := openapi_u_uid:openapi_u_uid(),
       'project_id' := openapi_u_uid:openapi_u_uid(),
       'created_at' := openapi_date_time:openapi_date_time(),
       'updated_at' := openapi_date_time:openapi_date_time(),
       'name' := binary(),
       'description' => binary(),
       'custom_branch_name' => binary()
     }.

encode(#{ 'key' := Key,
          'id' := Id,
          'organization_id' := OrganizationId,
          'project_id' := ProjectId,
          'created_at' := CreatedAt,
          'updated_at' := UpdatedAt,
          'name' := Name,
          'description' := Description,
          'custom_branch_name' := CustomBranchName
        }) ->
    #{ 'key' => Key,
       'id' => Id,
       'organization_id' => OrganizationId,
       'project_id' => ProjectId,
       'created_at' => CreatedAt,
       'updated_at' => UpdatedAt,
       'name' => Name,
       'description' => Description,
       'custom_branch_name' => CustomBranchName
     }.
