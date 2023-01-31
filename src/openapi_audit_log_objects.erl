-module(openapi_audit_log_objects).

-export([encode/1]).

-export_type([openapi_audit_log_objects/0]).

-type openapi_audit_log_objects() ::
    #{ 'organization_object' => openapi_organization_object:openapi_organization_object(),
       'project_object' => openapi_project_object:openapi_project_object(),
       'environment_object' => openapi_environment_object:openapi_environment_object(),
       'pdp_config_object' => openapi_pdp_config_object:openapi_pdp_config_object(),
       'user_object' => openapi_user_object:openapi_user_object(),
       'action_object' => openapi_action_object:openapi_action_object(),
       'resource_type_object' => openapi_resource_type_object:openapi_resource_type_object(),
       'tenant_object' => openapi_tenant_object:openapi_tenant_object()
     }.

encode(#{ 'organization_object' := OrganizationObject,
          'project_object' := ProjectObject,
          'environment_object' := EnvironmentObject,
          'pdp_config_object' := PdpConfigObject,
          'user_object' := UserObject,
          'action_object' := ActionObject,
          'resource_type_object' := ResourceTypeObject,
          'tenant_object' := TenantObject
        }) ->
    #{ 'organization_object' => OrganizationObject,
       'project_object' => ProjectObject,
       'environment_object' => EnvironmentObject,
       'pdp_config_object' => PdpConfigObject,
       'user_object' => UserObject,
       'action_object' => ActionObject,
       'resource_type_object' => ResourceTypeObject,
       'tenant_object' => TenantObject
     }.
