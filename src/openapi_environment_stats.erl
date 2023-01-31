-module(openapi_environment_stats).

-export([encode/1]).

-export_type([openapi_environment_stats/0]).

-type openapi_environment_stats() ::
    #{ 'key' := binary(),
       'id' := openapi_u_uid:openapi_u_uid(),
       'organization_id' := openapi_u_uid:openapi_u_uid(),
       'project_id' := openapi_u_uid:openapi_u_uid(),
       'created_at' := openapi_date_time:openapi_date_time(),
       'updated_at' := openapi_date_time:openapi_date_time(),
       'name' := binary(),
       'description' => binary(),
       'custom_branch_name' => binary(),
       'pdp_configs' := list(),
       'stats' := openapi_statistics:openapi_statistics()
     }.

encode(#{ 'key' := Key,
          'id' := Id,
          'organization_id' := OrganizationId,
          'project_id' := ProjectId,
          'created_at' := CreatedAt,
          'updated_at' := UpdatedAt,
          'name' := Name,
          'description' := Description,
          'custom_branch_name' := CustomBranchName,
          'pdp_configs' := PdpConfigs,
          'stats' := Stats
        }) ->
    #{ 'key' => Key,
       'id' => Id,
       'organization_id' => OrganizationId,
       'project_id' => ProjectId,
       'created_at' => CreatedAt,
       'updated_at' => UpdatedAt,
       'name' => Name,
       'description' => Description,
       'custom_branch_name' => CustomBranchName,
       'pdp_configs' => PdpConfigs,
       'stats' => Stats
     }.
